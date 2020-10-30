class Word < ApplicationRecord
  belongs_to :category
  
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validate :only_one_correct_answer
  # validate :unique_choice
  
  validates :word, presence: true, length: { minimum: 3 }
  validates :category_id, presence: true

  private
    def only_one_correct_answer
      count = choices.select{ |choice| choice.is_correct == true }.length

      if count != 1
        return errors.add(:word, "should ONLY have 1 correct answer")
      end
    end

    # def unique_choice
      # abort
      # unless self.attributes.select{ |choice| choice.choice.include? }.values.uniq.length < 1
      #   return errors.add(:word, "should have unique choices")
      # end
    # end
end
