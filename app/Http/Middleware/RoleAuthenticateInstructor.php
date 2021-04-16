<?php

namespace App\Http\Middleware;

use Illuminate\Http\Response;
use Closure;
use Auth;

class RoleAuthenticateInstructor
{
    public function handle($request, Closure $next, ...$notaries)
    {
    	if(Auth::user()->user_type == 'Instructor') {
            if(in_array(Auth::user()->instructor_type, $notaries)){
                return $next($request);
            } else {
                return new Response(abort(401));
            }
    	}
    	return $next($request);
    }
}
