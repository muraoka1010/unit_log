class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  has_many :subjects
end