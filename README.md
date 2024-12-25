# README

アプリケーション名	
  UnitLog
アプリケーション概要	
  大学で取得した単位を効率的に管理し、卒業までの進捗を一目で把握できるアプリ
URL	
  https://unit-log.onrender.com
テスト用アカウント	
  ユーザー名 admin 
  パスワード 2222
利用方法	
 ・トップページのヘッダーから、新規登録をする。
 ・ダッシュボードで詳細を確認をクリックすると、卒業要件の新規作成の画面に移動するので、それぞれ入力する。
 ・単位を追加するをクリックし、講義名、単位数、分類をそれぞれ入力する。
 ・追加した単位と卒業要件はクリックボードで、表示される。
 ・追加した単位と卒業要件はそれぞれクリックボードの編集ボタンを押して編集できる。
 ・単位の編集ページで、単位を消去することもできる。
アプリケーションを作成した背景	このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記載。
  大学で履修登録で講義を選ぶときに進級要件と卒業要件を確認しながら講義を選ぶ必要があったが、それを確認する方法が紙でできた成績表のみだった。
  その成績表が見づらく、科目の分類の仕方も非常に細かかったので、確認が面倒だった。
  そのため、自分が進級・卒業に必要な単位数と自分が取得している単位をまとめて、管理すれば確認もしやすくなるのではと思い、このようなアプリケーションを開発することにした。
実装した機能についての画像やGIFおよびその説明
  https://i.gyazo.com/561a334b87e0f10b150bc9f86013d7f9.png
  単位を追加すると、追加した単位の科目名・単位数・科目の分類が表示される。また、卒業要項を満たすためにあとどれだけ必要かどうかや、現在取得している単位が必要な単位数の何%かを確認できる。
データベース設計	
   C:\Users\yuto8\OneDrive\画像\UnitLog.png
画面遷移図	
   C:\Users\yuto8\OneDrive\画像\画像遷移.png
開発環境	使用した言語・サービスを記載。
  Ruby,Javascript,Chart.js
ローカルでの動作方法
  以下のコマンドを順に実行
  % git clone https://github.com/muraoka1010/unit_log.git
  % cd unit_log
  % bundle install
  % rails db:create
  % rails db:migrate

工夫したポイント
  できるだけ見やすくなるように、取得単位数と取得単位リストの部分に、スライドバーを設置したこと
改善点	
  科目の分類で、現在、必修・選択・自由の三つが用意されているが、その分類を追加できるようにして、反映させたい。
制作時間
  1週間

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
| Column	                 | Type	       | Options                        |
| ------                   | ----------  | ------------------------------ |
| required_credits         | integer     | null: false                    |
| required_core_credits    | integer     | null: false                    |
| elective_credits         | integer     | null: false                    |
| free_credits             | integer     | null: false                    |
| user_id                  | integer     | null: false                    |

### graduation_requirements
 `belongs_to :user`