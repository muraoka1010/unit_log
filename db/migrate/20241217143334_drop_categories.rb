class DropCategories < ActiveRecord::Migration[7.0]
  def change
    # 外部キー制約を削除
    remove_foreign_key :subjects, :categories
    
    # category_idカラムを削除
    remove_column :subjects, :category_id, :integer
    
    drop_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
