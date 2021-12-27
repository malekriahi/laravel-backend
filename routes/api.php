<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post("login",[UserController::class,'index']);
Route::post("registre",'UserController@create');

Route::post("approuve",'ApprouveController@create');
Route::get("all",'ApprouveController@index');
Route::delete("delete/{id}",'ApprouveController@destroy');



Route::get("userPhoto/{id}",'UserController@userPhoto');
Route::get("postPhoto/{id}",'PostController@postPhoto');
Route::get("pubPhoto/{id}",'PubliciteController@pubPhoto');



Route::group(['middleware' => 'auth:sanctum'], function(){
    Route::post("addphotoPub/{id}",'PubliciteController@addPhoto');
    Route::post("addphotoPost/{id}",'PostController@addPhoto');
    Route::post("addphotoUser",'UserController@addPhotoUser');
    Route::get("signale/{id}","PostController@signale");
    Route::get("showProfil/{id}",'UserController@showProfil');
    Route::post('addphoto/{id}','PostController@addPhoto');
    Route::get('like/{id}','JaimeController@like');
    Route::get('dislike/{id}','JaimeController@dislike');
    Route::get("abonne/{id}",'AbonnementController@abonne');
    Route::get("desabonne/{id}",'AbonnementController@desabonne');
    Route::get("accueil",'AbonnementController@accueil');
    Route::post('posts/filter','PostController@filter');
    Route::post("search",'UserController@search');
    Route::get("user",'UserController@profil');
    Route::apiResource('diff','DiffusionController');
    Route::apiResource('posts','PostController');
    Route::post('commentaire/{id}','CommentaireController@store');
    Route::apiResource('commentaire','CommentaireController');
    Route::apiResource('publicite','PubliciteController');
    Route::post("updatePassword",'UserController@updatePassword');
    Route::post("updateUserName",'UserController@updateUserName');
    });


