class AddCreditsToGraduationRequirements < ActiveRecord::Migration[7.0]
  def change
    add_column :graduation_requirements, :required_core_credits, :integer
    add_column :graduation_requirements, :elective_credits, :integer
    add_column :graduation_requirements, :free_credits, :integer
  end
end
