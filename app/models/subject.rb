class Subject < ApplicationRecord
  belongs_to :user

  # 必須項目のバリデーション
  with_options presence: true do
    validates :name, length: { maximum: 100 }
    validates :credits, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :category, inclusion: { in: ['必修', '選択', '自由'], message: "は '必修', '選択', '自由' のいずれかを指定してください" }
  end
end
