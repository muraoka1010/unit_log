class AddUserIdToGraduationRequirements < ActiveRecord::Migration[7.0]
  def change
    add_column :graduation_requirements, :user_id, :integer
  end
end
