# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'DEFAULT ADMIN'
admin = Admin.where(:email => "admin@test.com").first_or_initialize
if admin.new_record?
  admin.password = "12345678"
  admin.password_confirmation = "12345678"
  admin.save
end
puts 'admin: ' << admin.email