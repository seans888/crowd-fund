<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Project;

/**
 * ProjectSearch represents the model behind the search form about `app\models\Project`.
 */
class ProjectSearch extends Project
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['project_name', 'project_objective', 'started_date', 'duration', 'cost', 'fund_resources', 'people_involve', 'beneficiaries'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Project::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'started_date' => $this->started_date,
        ]);

        $query->andFilterWhere(['like', 'project_name', $this->project_name])
            ->andFilterWhere(['like', 'project_objective', $this->project_objective])
            ->andFilterWhere(['like', 'duration', $this->duration])
            ->andFilterWhere(['like', 'cost', $this->cost])
            ->andFilterWhere(['like', 'fund_resources', $this->fund_resources])
            ->andFilterWhere(['like', 'people_involve', $this->people_involve])
            ->andFilterWhere(['like', 'beneficiaries', $this->beneficiaries]);

        return $dataProvider;
    }
}
