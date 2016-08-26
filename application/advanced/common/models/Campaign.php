<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "campaign".
 *
 * @property integer $id
 * @property string $campaign_name
 * @property string $campaign_type
 * @property integer $donor_Id
 *
 * @property Donor $donor
 * @property ProjectHasCampaign[] $projectHasCampaigns
 */
class Campaign extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'campaign';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['campaign_name', 'campaign_type', 'donor_Id'], 'required'],
            [['donor_Id'], 'integer'],
            [['campaign_name', 'campaign_type'], 'string', 'max' => 45],
            [['donor_Id'], 'exist', 'skipOnError' => true, 'targetClass' => Donor::className(), 'targetAttribute' => ['donor_Id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'campaign_name' => 'Campaign Name',
            'campaign_type' => 'Campaign Type',
            'donor_Id' => 'Donor  ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDonor()
    {
        return $this->hasOne(Donor::className(), ['id' => 'donor_Id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProjectHasCampaigns()
    {
        return $this->hasMany(ProjectHasCampaign::className(), ['campaign_id' => 'id']);
    }
}
