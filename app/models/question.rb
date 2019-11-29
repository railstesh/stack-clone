# frozen_string_literal: true

# Question model class
class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true, length: { minimum: 5 }
end
