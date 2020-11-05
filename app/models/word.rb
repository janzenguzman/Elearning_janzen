class Word < ApplicationRecord
  belongs_to :category
  
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validate :only_one_correct_answer
  validate :unique_choice
  validate :correct_answer

  has_one :answer, dependent: :destroy
  
  validates :word, presence: true, length: { minimum: 3 }
  validates :category_id, presence: true

  private
    def only_one_correct_answer
      count = choices.select{ |choice| choice.is_correct == true }.length

      if count != 1
        return errors.add(:word, "should ONLY have 1 correct answer")
      end
    end

    def unique_choice
      if choices.uniq{ |choice| choice.choice }.length < choices.length
        return errors.add(:word, "choices should be unique")
      end
    end

    def correct_answer
      choices.find_by(is_correct: true)
    end
end
