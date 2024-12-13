class GraduationRequirement < ApplicationRecord
  belongs_to :category

  # 必要な単位が設定されているか確認するバリデーション
  validates :required_credits, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
