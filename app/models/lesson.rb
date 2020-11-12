class Lesson < ApplicationRecord

  after_create :create_activity

  belongs_to :user
  belongs_to :category
  has_many :words, through: :category
  has_many :answers, dependent: :destroy

  has_one :activity, as: :action

  private
    def create_activity
      Activity.create(
        action: self,
        user: user
      )
    end
end
