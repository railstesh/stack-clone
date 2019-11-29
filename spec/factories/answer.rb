# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    description { 'Actioncable testing answer' }
    question { 1 }
    user_id { 1 }
  end
end
