<?php

namespace backend\api\controllers;

use backend\api\models\UserCreateForm;
use backend\api\models\Userprofile;
use Yii;
use yii\helpers\Json;
use yii\rest\Controller;
use common\models\User;

class FirstController extends Controller
{
    public $modelClass = 'common\models\User';

    public function getPost(){
        return Yii::$app->request->post();
    }

    public function actionLogin(){
        $jsonPost = $this->getPost();

        if($jsonPost !== null&&$jsonPost['username']&&$jsonPost['password']){

            if (User::findByUsername($jsonPost['username'])){
                $hash = User::findByUsername($jsonPost['username']);

                if (Yii::$app->getSecurity()->validatePassword($jsonPost['password'], $hash->password_hash)) {
                    $jsonResponse = array('success'=>true,'token'=>User::findByUsername($jsonPost['username'])->getAuthKey());
                } else {
                    $jsonResponse = "Login Failed, Wrong Password";
                }
            }
        }else{
            $jsonResponse = "Login Failed";
            // do your query stuff here
        }
        return Json::encode($jsonResponse);
    }

    public function actionRegister(){
        $jsonPost = $this->getPost();
        if (User::findByUsername($jsonPost['username'])==null&&User::find()->where(['email'=>$jsonPost['email']])->one()==null) {
            $modelNewUser = new UserCreateForm();
            $modelNewUser->username = $jsonPost['username'];
            $modelNewUser->email = $jsonPost['email'];
            $modelNewUser->password = $jsonPost['password'];

            $modelNewUser->signup();
            $user = User::findByUsername($jsonPost['username']);
            $jsonResponse =  json_encode(array('message'=>$user->id));
        }else
            $jsonResponse = array('message'=>'failled');

        return  json_encode($jsonResponse);
    }

    public function actionLogout(){
        Yii::$app->user->logout();

        return  array('success'=>true,'status'=>'true');
    }

    public function actionDeleteAccount(){
        $jsonPost = $this->getPost();

        return  User::findOne(['id'=>$jsonPost['id']])->delete();
    }


}