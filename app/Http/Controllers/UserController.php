<?php

namespace App\Http\Controllers;

use App\Http\Resources\User as UserResource;
use App\User;

class UserController extends Controller
{
    public function __construct()
    {
        UserResource::$wrap = 'items';
    }

    public function show(User $user)
    {
        return new UserResource($user);
    }
}
