class RemoveCategoryIdFromSubjects < ActiveRecord::Migration[7.0]
  def change
    if column_exists?(:subjects, :category_id)
      remove_column :subjects, :category_id, :integer
    end
  end
end
