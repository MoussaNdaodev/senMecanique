<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\Login\LoginRequest;
use App\Http\Resources\Login\LoginResource;
use App\Models\User;
use Essa\APIToolKit\Api\ApiResponse;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    use ApiResponse;

    public function login(LoginRequest $request)
    {
        try {
            if (auth()->attempt($request->only(["email", "password"]))) {
                $user = User::where('email', $request->email)->first();
                if ($user->tokens()->where('tokenable_id', $user->id)->exists()) {
                    return response()->json([
                        "message" => "User is already logged in",
                    ], 200);
                }

                $token = $user->createToken("auth-token")->plainTextToken;
                return $this->responseCreated('User is logged in successfully', new LoginResource($user, $token));
            } else {
                return response()->json([
                    "message" => "Incorrect email or password",
                ], 401);
            }
        } catch (Exception $exception) {
            return response()->json([
                "error" => $exception->getMessage(),
            ], 500);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'Logged out successfully'], 200);
    }
}
