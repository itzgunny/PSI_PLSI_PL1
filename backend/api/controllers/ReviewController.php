<?php

namespace backend\api\controllers;

use backend\api\models\Reviews;
use yii\helpers\Json;
use yii\rest\ActiveController;

class ReviewController extends ActiveController
{
    public $modelClass ='backend\api\models\Reviews';

    public function actionFromuser($id){
        $reviews =Reviews::find()->where(['userid'=>$id])->all();
        if($reviews==null)
            $jsonResponse= 'Sem Reviews';
        else
            $jsonResponse =$reviews;

        return Json::encode($jsonResponse);
    }
}