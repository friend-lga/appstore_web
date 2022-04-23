# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(email: 'admin@example.com', name: 'Администратор', role: :admin, password: '1234', password_confirmation: '1234', consent: true) if Rails.env.development?
User.create!(email: 'user@example.com', name: 'Пользователь', role: :user, password: '1234', password_confirmation: '1234', consent: true) if Rails.env.development?
User.create!(email: 'dev@example.com', name: 'Разработчик', role: :developer, password: '1234', password_confirmation: '1234', consent: true) if Rails.env.development?
User.create!(email: 'adv@example.com', name: 'Рекламодатель', role: :advertiser, password: '1234', password_confirmation: '1234', consent: true) if Rails.env.development?
