class Choice < ApplicationRecord
  belongs_to :word
  choices_attributes = ([:word_id, :choice])
  validates :word_id, presence: true
  validates :choice, presence: true, length: { minimum: 3 }
end
