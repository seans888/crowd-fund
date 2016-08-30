<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProjectSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'project_name') ?>

    <?= $form->field($model, 'project_objective') ?>

    <?= $form->field($model, 'started_date') ?>

    <?= $form->field($model, 'duration') ?>

    <?php // echo $form->field($model, 'cost') ?>

    <?php // echo $form->field($model, 'fund_resources') ?>

    <?php // echo $form->field($model, 'people_involve') ?>

    <?php // echo $form->field($model, 'beneficiaries') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
