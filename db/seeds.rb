puts "Starting Faker..."

User.create!(name:  "Admin",
  email: "admin@framgia.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true)

puts "Faker is generating data... Please wait..."

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@framgia.com"
  password = "111111"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end

puts "Done! Created #{User.count} accounts"
