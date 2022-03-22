User.create!(name:  ENV["SECRET_NAME"],
             email: ENV["SECRET_EMAIL"],
             password:  ENV["SECRET_PASSWORD"],
             password_confirmation: ENV["SECRET_PASSWORD_CONFIRMATION"],
             admin: ENV["SECRET_ADMIN"])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
