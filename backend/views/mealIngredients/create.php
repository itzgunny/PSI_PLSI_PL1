<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\MealIngredients */

$this->title = 'Create Meal Ingredients';
$this->params['breadcrumbs'][] = ['label' => 'Meal Ingredients', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="meal-ingredients-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>