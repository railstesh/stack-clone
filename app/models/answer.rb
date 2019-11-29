# frozen_string_literal: true

# Answer model class
class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :description, presence: true
  scope :datetime, -> { order(created_at: :desc) }
end
