# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    title { 'Actioncable testing' }
    description { 'Actioncable testing' }
    user { FactoryBot.create(:user) }
  end
end
