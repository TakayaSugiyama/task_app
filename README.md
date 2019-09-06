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
