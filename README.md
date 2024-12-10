# README

## usersテーブル(ユーザー情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |

### users
- `has_many :subjects`


## subjectsテーブル(科目情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| credits             | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| user_id             | integer    | null: false                    |

### subjects
- `belongs_to :user`
- `belongs_to :category`

##  categories テーブル (科目カテゴリの管理)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| name                | string     | null: false                    |

### categories
`has_many :subjects`
