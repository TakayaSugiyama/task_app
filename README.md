## テーブルの構造 

### tasksテーブル   task_model
| カラム | データ型 |
|:----:|:-----:|
|id| integer|
| task_title | string |
| task_content |text |
| status | string |
| deadline | datetime |
| priority | string |
| user_id | references|
| label | string |
|created_at| timestamps|
|updated_at| timestamps|
 
### usersテーブル  user_model
| カラム | データ型 |
|:----:|:-----:|
|id|integer|
| name | string |
| email |string |
| password_digest | string |
| label | string |
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
