<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Requirements */

$this->title = 'Create Requirements';
$this->params['breadcrumbs'][] = ['label' => 'Requirements', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="requirements-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
