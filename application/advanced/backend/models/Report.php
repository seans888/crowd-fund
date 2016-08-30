<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "report".
 *
 * @property integer $id
 * @property string $report_type
 * @property integer $project_Id
 *
 * @property AdminHasReport[] $adminHasReports
 * @property Expenses[] $expenses
 * @property Project $project
 */
class Report extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'report';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'report_type', 'project_Id'], 'required'],
            [['id', 'project_Id'], 'integer'],
            [['report_type'], 'string', 'max' => 45],
            [['project_Id'], 'exist', 'skipOnError' => true, 'targetClass' => Project::className(), 'targetAttribute' => ['project_Id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'report_type' => 'Report Type',
            'project_Id' => 'Project  ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAdminHasReports()
    {
        return $this->hasMany(AdminHasReport::className(), ['report_Id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getExpenses()
    {
        return $this->hasMany(Expenses::className(), ['report_Id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProject()
    {
        return $this->hasOne(Project::className(), ['id' => 'project_Id']);
    }
}
