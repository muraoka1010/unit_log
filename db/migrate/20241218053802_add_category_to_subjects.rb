class AddCategoryToSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :category, :string
  end
end
