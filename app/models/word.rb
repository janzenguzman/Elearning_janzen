class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  
  validates :word, presence: true, length: { minimum: 2 }
  validates :category_id, presence: true
end
