class Choice < ApplicationRecord
  belongs_to :word
  validates :choice, presence: true, length: { minimum: 3 }
end
