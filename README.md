# サービス名
### SinatraNakamatsuでrubyを復習する

### SinatraNakamatsuの機能
* 新規登録機能
* Twiiter連携機能



#　テーブル設計

### users
| column |  type  | null | index |
|:------:|:------:|:----:|:-----:|
| name   | string | false| index |
| email  | string | false| index |
|password| string | false|       |

### twitter
| column |   type    | null | index |
|:------:|:---------:|:----:|:-----:|
| body   | string    |      |       |
| image  | string    | false|       |
|group-id| reference | false| index |
|user_id | reference | false| index |
