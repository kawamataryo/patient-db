
require 'Faker'
Faker::Config.locale = :ja

puts Faker::Number.number(7)
