<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\{Request, Response};
use Illuminate\Support\Facades\Session;
class GuestMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Session::has('guest_id') && auth()->user() == null) {
            // Jika tidak ada, buat ID guest baru dan simpan di session
            $guestId = uniqid('guest_');
            Session::put('guest_id', $guestId);
        }
        return $next($request);
    }
}
