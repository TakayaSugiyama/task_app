## 環境
- Ruby 2.6.3 
- Rails 5.2.3 

## 手順
```
 1.  git pull  https://github.com/TakayaSugiyama/task_app.git 

 2.  bundle install

 3.  rails db:create 

 4.  rails db:migrate

 5.  rails s

```

## heroku 

  https://task-app-manyo.herokuapp.com/


## テーブルの構造 

### tasksテーブル   task_model
| カラム | データ型 |
|:----:|:-----:|
|id| integer|
| title | string |
| content |text |
| status | string |
| deadline | datetime |
| priority | string |
| user_id | references|
|created_at| timestamps|
|updated_at| timestamps|
 
### usersテーブル  user_model
| カラム | データ型 |
|:----:|:-----:|
|id|integer|
| name | string |
| email |string |
| password_digest | string |
|created_at| timestamps|
|updated_at| timestamps| 

### labelsテーブル  label_model
| カラム | データ型 |
|:----:|:-----:|
|id|integer|
| label_name | string |
| task_id |references |
|created_at| timestamps|
|updated_at| timestamps| 
