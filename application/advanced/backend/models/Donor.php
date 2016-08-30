<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "donor".
 *
 * @property integer $id
 * @property string $donor_fname
 * @property string $donor_lname
 * @property string $donor_address
 *
 * @property Campaign[] $campaigns
 * @property DonorHasRequirements[] $donorHasRequirements
 */
class Donor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'donor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['donor_fname', 'donor_lname', 'donor_address'], 'required'],
            [['donor_fname', 'donor_lname', 'donor_address'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'donor_fname' => 'Donor Fname',
            'donor_lname' => 'Donor Lname',
            'donor_address' => 'Donor Address',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCampaigns()
    {
        return $this->hasMany(Campaign::className(), ['donor_Id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDonorHasRequirements()
    {
        return $this->hasMany(DonorHasRequirements::className(), ['donor_id' => 'id']);
    }
}
