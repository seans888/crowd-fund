<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "project".
 *
 * @property integer $id
 * @property string $project_name
 * @property string $project_objective
 * @property string $started_date
 * @property string $duration
 * @property string $cost
 * @property string $fund_resources
 * @property string $people_involve
 * @property string $beneficiaries
 *
 * @property AdminHasProject[] $adminHasProjects
 * @property ProjectHasCampaign[] $projectHasCampaigns
 * @property Report[] $reports
 * @property RequirementsHasProject[] $requirementsHasProjects
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'project';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['project_name', 'project_objective', 'started_date', 'duration', 'cost', 'fund_resources', 'people_involve', 'beneficiaries'], 'required'],
            [['started_date'], 'safe'],
            [['project_name', 'project_objective', 'duration', 'cost', 'fund_resources', 'people_involve', 'beneficiaries'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'project_name' => 'Project Name',
            'project_objective' => 'Project Objective',
            'started_date' => 'Started Date',
            'duration' => 'Duration',
            'cost' => 'Cost',
            'fund_resources' => 'Fund Resources',
            'people_involve' => 'People Involve',
            'beneficiaries' => 'Beneficiaries',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAdminHasProjects()
    {
        return $this->hasMany(AdminHasProject::className(), ['project_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjectHasCampaigns()
    {
        return $this->hasMany(ProjectHasCampaign::className(), ['project_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReports()
    {
        return $this->hasMany(Report::className(), ['project_Id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRequirementsHasProjects()
    {
        return $this->hasMany(RequirementsHasProject::className(), ['project_id' => 'id']);
    }
}
