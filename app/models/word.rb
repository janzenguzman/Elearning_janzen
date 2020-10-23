class Word < ApplicationRecord
  belongs_to :category, class_name: "Category"
  validates :word, presence: true
end
