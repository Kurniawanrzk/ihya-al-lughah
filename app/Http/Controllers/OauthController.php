<?php

namespace App\Http\Controllers;

use Auth;
use Laravel\Socialite\Facades\Socialite;
use Exception;
use App\Models\{User, AttemptQiraah, HasilBenarSalah, HasilSoalLatihan};

class OauthController extends Controller
{
    public function redirectToProvider()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleProviderCallback()
    {
        try {
            $user = Socialite::driver('google')->user();

            $finduser = User::where('gauth_id', $user->id)->first();

            if ($finduser) {
                Auth::login($finduser);
                session()->forget('guest_id'); // Destroy session after login
                return redirect()->route("index");
            } else {
                $newUser = User::create([
                    'name' => $user->name,
                    'email' => $user->email,
                    'gauth_id' => $user->id,
                    'gauth_type' => 'google',
                    'password' => bcrypt($user->name . $user->email . $user->id)
                ]);

                Auth::login($newUser);

                $this->updateGuestDataToUser(session('guest_id'), auth()->user()->id);

                session()->forget('guest_id'); // Destroy session after login

                return redirect()->route("index");
            }
        } catch (Exception $e) {
            report($e);
            return redirect()->back();
        }
    }

    public function logout()
    {
        Auth::logout();
        session()->flush(); // Clear all session data
        return redirect()->route('index');
    }

    private function updateGuestDataToUser($guestId, $userId)
    {
        if (!$guestId) {
            return;
        }

        $attemptQiraah = AttemptQiraah::where("guest_id", $guestId);
        if ($attemptQiraah->exists()) {
            $attemptQiraah->update(['id_user' => $userId, 'guest_id' => null]);
        }

        $hasilLatihan = HasilSoalLatihan::where("guest_id", $guestId);
        if ($hasilLatihan->exists()) {
            $hasilLatihan->update(['user_id' => $userId, 'guest_id' => null]);
        }

        $hasilBenarSalah = HasilBenarSalah::where("guest_id", $guestId);
        if ($hasilBenarSalah->exists()) {
            $hasilBenarSalah->update(['user_id' => $userId, 'guest_id' => null]);
        }
    }
}