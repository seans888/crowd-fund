<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "admin".
 *
 * @property integer $id
 * @property string $admin_name
 * @property string $admin_role
 *
 * @property AdminHasProject[] $adminHasProjects
 * @property AdminHasReport[] $adminHasReports
 */
class Admin extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'admin';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['admin_name', 'admin_role'], 'required'],
            [['admin_name', 'admin_role'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'admin_name' => 'Admin Name',
            'admin_role' => 'Admin Role',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAdminHasProjects()
    {
        return $this->hasMany(AdminHasProject::className(), ['admin_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAdminHasReports()
    {
        return $this->hasMany(AdminHasReport::className(), ['admin_id' => 'id']);
    }
}
