## 環境
- Ruby 2.6.3 
- Rails 5.2.3 

## 手順
```
 1. $ git pull  https://github.com/TakayaSugiyama/task_app.git 

 2. $ cd  task_app

 3. $ heroku login -i 
 
 4. $ heroku create 

 5. $ git add .

 6. $ git commit -m "push to Heroku"

 7. $ git push heroku master 
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
| status | integer |
| deadline | datetime |
| priority | integer |
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
