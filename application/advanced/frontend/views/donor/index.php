<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\DonorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Donor';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="donor-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Account', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'donor_fname',
            'donor_lname',
            'donor_address',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
