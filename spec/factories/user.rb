# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "test#{rand(100)}@example.com" }
    password { '123456' }
  end
end
