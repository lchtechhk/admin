<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\App;
use Log;

class HttpsProtocol {

    public function handle($request, Closure $next)
    {
        // Log::info("Appenvironment : " . App::environment());
        Log::info("HttpsProtocol : " . $request->getRequestUri());
        if (!$request->secure()) {
            // if (!$request->secure() && App::environment() === 'production') {
                // return redirect()->secure('/');
                // return redirect()->secure($request->getRequestUri());
            }

            return $next($request); 
    }
}