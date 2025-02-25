class GraduationRequirement < ApplicationRecord
  belongs_to :user
  # 必須フィールドのバリデーション
  validates :required_credits, :required_core_credits, :elective_credits, :free_credits, presence: true

  # 数値の範囲と型のバリデーション
  validates :required_credits, :required_core_credits, :elective_credits, :free_credits,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # 必須単位数の合計チェック
  validate :validate_total_credits

  private

  # 必須単位数の合計が一致しているかを確認する
  def validate_total_credits
    total = required_core_credits.to_i + elective_credits.to_i + free_credits.to_i
    if total != required_credits.to_i
      errors.add(:required_credits, "合計単位数 (#{total}) が必要単位数 (#{required_credits}) と一致しません")
    end
  end
end
