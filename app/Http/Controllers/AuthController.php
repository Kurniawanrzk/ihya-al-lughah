<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class AuthController extends Controller
{
    public function loginIndex() 
    {
        
        return view("page.auth.login");
    }

    public function login()
    {

    }

    public function loginAdmin() 
    {
        if(!is_null(auth()->user())) {
            return redirect()->route("dashboard_admin_index");
        }
       return view("page.admin.login"); 
    }

    public function loginAdminPost(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);
        
        if (auth()->attempt(['email' => $request->email, 'password' => $request->password])) {
            $request->session()->regenerate();
            return redirect()->route('dashboard_admin_index')->with('success', 'Login berhasil!');
        } else {
            return back()->withErrors(['email' => 'Email atau password salah.'])->withInput();
        }
    }
    
   

}
