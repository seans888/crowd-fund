<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Donor */

$this->title = 'Update Donor: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Donors', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="donor-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
