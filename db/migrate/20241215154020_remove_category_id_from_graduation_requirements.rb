class RemoveCategoryIdFromGraduationRequirements < ActiveRecord::Migration[7.0]
  def change
    remove_column :graduation_requirements, :category_id, :integer
  end
end
