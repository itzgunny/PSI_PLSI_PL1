<?php

use yii\bootstrap4\Nav;
use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Userprofile */

$this->title = $model->name;

\yii\web\YiiAsset::register($this);
?>
<div class="container">
    <div class="main-body">
        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Admin"
                                 class="rounded-circle" width="150">
                            <div class="mt-3">
                                <p class="text-secondary mb-1"><?php echo $model->name ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <?php echo $model->name ?>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Nif</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <?php echo $model->nif ?>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Phone</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <?php echo $model->cellphone ?>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                Rua <?php echo $model->street ?>, <?php echo $model->floor ?> Nº <?php echo $model->door ?>, <?php echo $model->city ?>
                            </div>
                        </div>
                        <hr>
                        <?php
                        $menuItems[] = '<li>'
                            . Html::beginForm(['/userprofile/update','id'=>$model->id], 'post', ['class' => 'form-inline'])
                            . Html::submitButton(
                            'Atulizar Informação',
                            ['class' => 'btn btn-secondary']
                            )
                            . Html::endForm()
                            . '</li>';
                        echo Nav::widget([
                            'options' => ['class' => 'navbar-nav'],
                            'items' => $menuItems,]);
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>