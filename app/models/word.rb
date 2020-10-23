class Word < ApplicationRecord
  belongs_to :category
  validates :word, presence: true
  # validates :category_id, presence: true
end
