<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Donor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="donor-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'donor_fname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'donor_lname')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'donor_address')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
