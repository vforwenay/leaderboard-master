# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    driver_name { Faker::Name.name }
    car_number { Faker::Number.digit }
    car_colour { Faker::Color.hex_color }
    country { Faker::Address.country_code }
    last_lap { 0 }
    position { 0 }
    interval { 0 }
  end
end
