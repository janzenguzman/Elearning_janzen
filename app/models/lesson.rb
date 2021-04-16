class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :words, through: :category
  has_many :answers, dependent: :destroy

  has_one :activity, as: :action, dependent: :destroy
end
