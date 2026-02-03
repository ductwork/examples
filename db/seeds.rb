# frozen_string_literal: true

100.times do |i|
  User.create!(
    name: Faker::Name.name,
    age: Kernel.rand(21..99),
    favorite_food: Faker::Food.dish,
    last_enriched_at: 10.days.ago
  )
  puts "Created user ##{i + 1}"
end
