class CreateGraduationRequirements < ActiveRecord::Migration[7.0]
  def change
    create_table :graduation_requirements do |t|
      t.references :category, null: false, foreign_key: true
      t.integer :required_credits, null: false

      t.timestamps
    end
  end
end
