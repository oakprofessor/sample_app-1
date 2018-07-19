puts "Starting Faker..."

User.create!(name:  "Admin",
  email: "admin@framgia.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

puts "Faker is generating data... Please wait..."

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@framgia.com"
  password = "111111"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password,
     activated: true,
     activated_at: Time.zone.now)
end

puts "Done! Created #{User.count} accounts"
