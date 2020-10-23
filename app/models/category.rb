class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }
end
