# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  admin = User.create!(email: 'admin@example.com', name: 'Администратор', role: :admin, password: '1234', password_confirmation: '1234', consent: true)
  user = User.create!(email: 'user@example.com', name: 'Пользователь', role: :user, password: '1234', password_confirmation: '1234', consent: true)
  dev = User.create!(email: 'dev@example.com', name: 'Разработчик', role: :developer, password: '1234', password_confirmation: '1234', consent: true)
  adv = User.create!(email: 'adv@example.com', name: 'Рекламодатель', role: :advertiser, password: '1234', password_confirmation: '1234', consent: true)

  yandex = User.create!(email: 'admin@yandex.ru', name: 'Яндекс', role: :developer, password: '1234', password_confirmation: '1234', consent: true)
  mailru = User.create!(email: 'admin@mail.ru', name: 'Mail.Ru', role: :developer, password: '1234', password_confirmation: '1234', consent: true)
  vk = User.create!(email: 'admin@vk.ru', name: 'Вконтакте', role: :developer, password: '1234', password_confirmation: '1234', consent: true)
  rambler = User.create!(email: 'admin@rambler.ru', name: 'Рамблер', role: :developer, password: '1234', password_confirmation: '1234', consent: true)
  sber = User.create!(email: 'admin@sber.ru', name: 'Сбер', role: :developer, password: '1234', password_confirmation: '1234', consent: true)

  yandex.apps.create!(title: 'Яндекс.Карты', description: 'Приложени для построения маршрутов')
  yandex.apps.create!(title: 'Яндекс.Метро', description: 'Приложени для навигации в метро')
  yandex.apps.create!(title: 'Яндекс.Музыка', description: 'Приложени для прослушивания музыки и радио')
  yandex.apps.create!(title: 'Яндекс.Диск', description: 'Облачное хранилище для ваших файлов')
  yandex.apps.create!(title: 'Яндекс.Браузер', description: 'Приложение для серфинга в интернете')
  yandex.apps.create!(title: 'Яндекс.Маркет', description: 'Приложение для совершения покупок в интернете')
  yandex.apps.create!(title: 'Яндекс.Такси', description: 'Приложение для вызова такси')
  yandex.apps.create!(title: 'Яндекс.Еда', description: 'Приложение для заказа еды')
  yandex.apps.create!(title: 'Яндекс.Афиша', description: 'Афиша городских событий')
  yandex.apps.create!(title: 'Яндекс.Почта', description: 'Ваш почтовый ящик в интернете')
  yandex.apps.create!(title: 'Яндекс.Дзен', description: 'Социальная сеть в интернете')
  yandex.apps.create!(title: 'Яндекс.Лавка', description: 'Онлайн магазин продуктов питания')
  yandex.apps.create!(title: 'Кинопоиск', description: 'Онлайн кинотеатр')

  mailru.apps.create!(title: 'Облако Mail.ru', description: 'Облачное хранилище для ваших файлов')
  mailru.apps.create!(title: 'Почта Mail.ru', description: 'Ваш почтовый ящик в интернете')
  mailru.apps.create!(title: 'Одноклассники', description: 'Социальная сеть в интернете')

  vk.apps.create!(title: 'Вконтакте', description: 'Социальная сеть в интернете')

  rambler.apps.create!(title: 'Рамблер/почта', description: 'Ваш почтовый ящик в интернете')
  rambler.apps.create!(title: 'Рамблер/кино', description: 'Помощник покупки билетов в кино')
  rambler.apps.create!(title: 'Рамблер/касса', description: 'Пространство для оплаты онлайн покупок')
  rambler.apps.create!(title: 'Рамблер/афиша', description: 'Афиша городских событий')

  sber.apps.create!(title: 'СберБанк', description: 'Онлайн банк на каждый день')
  sber.apps.create!(title: 'СберЗвук', description: 'Приложени для прослушивания музыки и радио')
  sber.apps.create!(title: 'СберМегаМаркет', description: 'Приложение для совершения покупок в интернете')
  sber.apps.create!(title: 'Самокат', description: 'Онлайн магазин продуктов питания')
end
