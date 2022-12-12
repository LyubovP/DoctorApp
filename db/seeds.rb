# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: 'true' ) if Rails.env.development?
User.create!(email: 'lyubovdoctor@gmail.com', password: '123456', password_confirmation: '123456', role: 'doctor' ) if Rails.env.development?
User.create!(email: 'lyubovpatient@gmail.com', password: '123456', password_confirmation: '123456', role: 'patient' ) if Rails.env.development?
