<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "requirements".
 *
 * @property integer $id
 * @property string $requirements_type
 *
 * @property DonorHasRequirements[] $donorHasRequirements
 * @property RequirementsHasProject[] $requirementsHasProjects
 */
class Requirements extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'requirements';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['requirements_type'], 'required'],
            [['requirements_type'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'requirements_type' => 'Requirements Type',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDonorHasRequirements()
    {
        return $this->hasMany(DonorHasRequirements::className(), ['requirements_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRequirementsHasProjects()
    {
        return $this->hasMany(RequirementsHasProject::className(), ['requirements_id' => 'id']);
    }
}
