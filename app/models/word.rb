class Word < ApplicationRecord
  belongs_to :category
  
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  
  validates :word, presence: true, length: { minimum: 2 }
  validates :category_id, presence: true
end
