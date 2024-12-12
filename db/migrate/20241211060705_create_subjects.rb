class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false                    # 科目名
      t.integer :credits, null: false               # 単位数
      t.references :category, null: false, foreign_key: true, type: :bigint # カテゴリID (外部キー)
      t.references :user, null: false, foreign_key: true, type: :bigint     # ユーザーID (外部キー)
      t.timestamps
    end
  end
end
