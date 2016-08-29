<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "expenses".
 *
 * @property integer $id
 * @property integer $report_Id
 * @property string $expenses_report
 *
 * @property Report $report
 */
class Expenses extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'expenses';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'report_Id', 'expenses_report'], 'required'],
            [['id', 'report_Id'], 'integer'],
            [['expenses_report'], 'string', 'max' => 45],
            [['report_Id'], 'exist', 'skipOnError' => true, 'targetClass' => Report::className(), 'targetAttribute' => ['report_Id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'report_Id' => 'Report  ID',
            'expenses_report' => 'Expenses Report',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReport()
    {
        return $this->hasOne(Report::className(), ['id' => 'report_Id']);
    }
}
