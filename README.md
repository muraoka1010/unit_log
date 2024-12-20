# README

## usersテーブル(ユーザー情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |

### users
- `has_many :subjects`
`has_one :graduation_requirement`


## subjectsテーブル(科目情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| credits             | integer    | null: false                    |
| category            | integer    | null: false                    |
| user_id             | integer    | null: false                    |

### subjects
- `belongs_to :user`



##  graduation_requirements テーブル (卒業要項)
| Column	                   | Type	       | Options                        |
| ------                   | ----------  | ------------------------------ |
| required_credits         | integer     | null: false                    |
| required_core_credits    | integer     | null: false                    |
| elective_credits         | integer     | null: false                    |
| free_credits             | integer     | null: false                    |

### graduation_requirements
 `belongs_to :user`