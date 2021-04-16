<?php

namespace App\Http\Middleware;

use Illuminate\Http\Response;
use Closure;
use Auth;

class RoleAuthenticate
{
    public function handle($request, Closure $next, ...$notaries)
    {
        if(Auth::check()){
            if(in_array(Auth::user()->user_type, $notaries)){
                return $next($request);
            } else {
                return new Response(abort(401));
            }
        } else {
            return new Response(abort(401));
        }
    }
}
