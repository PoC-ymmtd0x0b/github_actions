# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    age { rand(10...60) }
  end
end
