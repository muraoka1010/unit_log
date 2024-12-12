class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :name, length: { maximum: 100 }
    validates :credits, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
end
