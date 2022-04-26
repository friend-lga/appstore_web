# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def icon_uri(filename)
  Rails.root.join('app', 'assets', 'images', 'icons', filename)
end

def default_icon_filename
  'default.webp'
end

def default_icon
  icon_uri(default_icon_filename)
end

def default_apk_filename
  'default.apk'
end

def default_apk
  Rails.root.join('app', 'assets', 'packages', default_apk_filename)
end

def category_id(category_name)
  Category.where(title: category_name).first.id
end

def create_user(email, name, role = :developer)
  user = User.create!(email: email, name: name, role: role, password: '1234', password_confirmation: '1234', consent: true)

  pp "User is created: #{name}"
  user
end

def create_app(user, ref_id, title, description, category_names)
  icon_filename = "#{ref_id}.webp"

  app = user.apps.new
  app.ref_id = ref_id
  app.title = title
  app.description = description
  app.icon.attach(io: File.open(icon_uri(icon_filename)), filename: icon_filename, content_type: 'image/webp')
  app.package.attach(io: File.open(default_apk), filename: default_apk_filename)
  category_names.each do |category_name|
    app.app_categories.new(category_id: category_id(category_name))
  end
  app.save!

  pp "App is created: #{ref_id}"
  app
end

if Rails.env.development?
  admin = create_user('admin@truestore.ru', 'Администратор', :admin)
  user = create_user('user@truestore.ru', 'Пользователь', :user)
  dev = create_user('dev@truestore.ru', 'Разработчик', :developer)
  adv = create_user('adv@truestore.ru', 'Рекламодатель', :advertiser)

  yandex = create_user('admin@yandex.ru', 'Яндекс')
  create_app(yandex, 'yandex_maps', 'Яндекс.Карты', 'Помощник в навигации', [:Навигация])
  create_app(yandex, 'yandex_metro', 'Яндекс.Метро', 'Навигации в метро', [:Навигация])
  create_app(yandex, 'yandex_music', 'Яндекс.Музыка', 'Слушайте музыку и радио онлайн', [:Аудио, :Развлечения])
  create_app(yandex, 'yandex_disk', 'Яндекс.Диск', 'Облачное хранилище', [:Инструменты])
  create_app(yandex, 'yandex_browser', 'Яндекс.Браузер', 'Приложение для серфинга в интернете', [:Инструменты])
  create_app(yandex, 'yandex_market', 'Яндекс.Маркет', 'Онлайн гипермаркет', [:Покупки])
  create_app(yandex, 'yandex_taxi', 'Яндекс.Такси', 'Приложение для вызова такси', [:Инструменты])
  create_app(yandex, 'yandex_eda', 'Яндекс.Еда', 'Доставка еды', [:Еда, :Покупки])
  create_app(yandex, 'yandex_afisha', 'Яндекс.Афиша', 'Афиша городских событий', [:Навигация])
  create_app(yandex, 'yandex_mail', 'Яндекс.Почта', 'Электронная почта', [:Инструменты])
  create_app(yandex, 'yandex_zen', 'Яндекс.Дзен', 'Социальная сеть', [:Социальное])
  create_app(yandex, 'yandex_lavka', 'Яндекс.Лавка', 'Онлайн магазин продуктов питания', [:Еда, :Покупки])
  create_app(yandex, 'yandex_kinopoisk', 'Кинопоиск', 'Онлайн кинотеатр и ТВ', [:Видео, :Развлечения])
  create_app(yandex, 'yandex_autoru', 'Авто.ру', 'Онлайн рынок подержанных автомобилей', [:Покупки])
  create_app(yandex, 'yandex_eda_couriers', 'Яндекс.Еда для курьеров', 'Сервис для курьеров', [:Работа])
  create_app(yandex, 'yandex_eda_restaurants', 'Яндекс.Еда для ресторанов', 'Сервис для ресторанов', [:Работа])
  create_app(yandex, 'yandex_edadil', 'Едадил', 'Поиск выгодных скидок и акций', [:Навигация, :Покупки])
  create_app(yandex, 'yandex_flights', 'Яндекс.Полеты', 'Покупка билетов на самолеты', [:Покупки, :Путешествия])
  create_app(yandex, 'yandex_health', 'Яндекс.Здоровье', 'Посетите врача онлайн', [:Здоровье])
  create_app(yandex, 'yandex_keyboard', 'Яндекс.Клавиатура', 'Альтернатива стандартной клавиатуре', [:Инструменты])
  create_app(yandex, 'yandex_messenger', 'Яндекс.Мессенджер', 'Онлайн мессенджер для общения', [:Социальное])
  create_app(yandex, 'yandex_navigator', 'Яндекс.Навигатор', 'Ассистент для навигации за рулем', [:Навигация])
  create_app(yandex, 'yandex_ofd', 'Яндекс.ОФД', 'Работа с кассовыми чеками', [:Бизнес, :Работа])
  create_app(yandex, 'yandex_realty', 'Яндекс.Недвижимость', 'Ваш персональный онлайн риелтор', [:Покупки])
  create_app(yandex, 'yandex_search', 'Яндекс', 'Самый популярный поисковик рунета', [:Инструменты])
  create_app(yandex, 'yandex_taxi_pro', 'Яндекс.Такси Pro', 'Сервис для водителей', [:Работа])
  create_app(yandex, 'yandex_telemost', 'Яндекс.Телемост', 'Проведение онлайн видеоконференций', [:Социальное, :Видео])
  create_app(yandex, 'yandex_trains', 'Яндекс.Поезда', 'Покупка билетов на поезда', [:Покупки, :Путешествия])
  create_app(yandex, 'yandex_translate', 'Яндекс.Переводчик', 'Ваш персональный переводчик', [:Инструменты])
  create_app(yandex, 'yandex_weather', 'Яндекс.Погода', 'Метеорологический ассистент', [:Инструменты])
  create_app(yandex, 'yandex_smart_home', 'Дом с Алисой', 'Система умного дома', [:Дом])
  create_app(yandex, 'yandex_market_sellers', 'Яндекс.Маркет для продавцов', 'Сервис для продавцов', [:Работа])
  create_app(yandex, 'yandex_doctor', 'Кабинет Врача', 'Сервис для врачей', [:Инструменты])
  create_app(yandex, 'yandex_radio', 'Яндекс.Радио', 'Онлайн радио', [:Аудио, :Развлечения])
  create_app(yandex, 'yandex_drive', 'Яндекс.Драйв', 'Каршеринг', [:Инструменты, :Навигация])

  mailru = create_user('admin@mail.ru', 'Mail.Ru')
  create_app(mailru, 'mailru_cloud', 'Облако Mail.Ru', 'Облачное хранилище', [:Инструменты])
  create_app(mailru, 'mailru_mail', 'Почта Mail.Ru', 'Электронная почта', [:Инструменты])
  create_app(mailru, 'mailru_classmates', 'Одноклассники', 'Социальная сеть', [:Социальное])
  create_app(mailru, 'mailru_icq', 'ICQ', 'Онлайн мессенджер для общения', [:Социальное])
  create_app(mailru, 'mailru_agent', 'Агент Mail.Ru', 'Онлайн мессенджер для общения', [:Социальное])

  vk = create_user('admin@vk.ru', 'Вконтакте')
  create_app(mailru, 'vk_vk', 'VK', 'Социальная сеть', [:Социальное])
  create_app(mailru, 'vk_apteki', 'VK Аптеки', 'Онлайн магазин лекарств', [:Покупки, :Здоровье])
  create_app(mailru, 'vk_calls', 'VK Calls', 'Приложение для проведения видеоконференций', [:Социальное, :Видео])
  create_app(mailru, 'vk_mail', 'VK Mail', 'Электронная почта', [:Инструменты])
  create_app(mailru, 'vk_marusya', 'VK Маруся', 'Голосовой помощник', [:Инструменты])
  create_app(mailru, 'vk_music', 'VK Музыка', 'Слушайте друг друга', [:Аудио, :Развлечения])
  create_app(mailru, 'vk_news', 'VK Новости', 'Читайте последние новости', [:Инструменты])
  create_app(mailru, 'vk_teams', 'VK Teams', 'Мессенджер для командной работы', [:Работа])
  create_app(mailru, 'vk_video', 'VK Видео', 'Онлайн кинотеатр и ТВ', [:Видео, :Развлечения])
  create_app(mailru, 'vk_work', 'VK Работа', 'Поиск вакансий', [:Работа])
  create_app(mailru, 'vk_youla', 'Юла', 'Легко покупайте быстро продавайте', [:Покупки])

  sber = create_user('admin@sber.ru', 'Сбер')
  create_app(mailru, 'sber_bank', 'СберБанк', 'Онлайн банк', [:Финансы])
  create_app(mailru, 'sber_business', 'СберБизнес', 'Помощник в бизнесе', [:Бизнес])
  create_app(mailru, 'sber_citydrive', 'СитиДрайв', 'Каршеринг', [:Инструменты, :Навигация])
  create_app(mailru, 'sber_citymobil', 'СитиМобил', 'Приложение для вызова такси', [:Инструменты])
  create_app(mailru, 'sber_citystart', 'СитиСтарт', 'Сервис для водителей', [:Работа])
  create_app(mailru, 'sber_eapteka', 'еАптека', 'Онлайн магазин лекарств', [:Покупки, :Здоровье])
  create_app(mailru, 'sber_health', 'СберЗдоровье', 'Посетите врача онлайн', [:Здоровье])
  create_app(mailru, 'sber_logistics', 'СберЛогистика', 'Отправляйте и отслеживайте посылки онлайн', [:Инструменты])
  create_app(mailru, 'sber_samokat', 'Самокат', 'Доставка продуктов', [:Еда, :Покупки])
  create_app(mailru, 'sber_samokat_dark_store', 'Самокат Dark Store', 'Сервис для работников', [:Работа])
  create_app(mailru, 'sber_samokat_pro', 'Самокат Pro', 'Сервис для работников', [:Работа])
  create_app(mailru, 'sber_megamarket', 'СберМегаМаркет', 'Онлайн гипермаркет', [:Покупки])
  create_app(mailru, 'sber_spasibo', 'СберСпасибо', 'Бонусная программа и кешбэк', [:Финансы])
  create_app(mailru, 'sber_zvuk', 'СберЗвук', 'Стриминговый сервис', [:Аудио, :Развлечения])

  rambler = create_user('admin@rambler.ru', 'Рамблер')
  create_app(mailru, 'rambler_afisha', 'Рамблер/Афиша', 'Афиша городских событий', [:Навигация])
  create_app(mailru, 'rambler_kassa', 'Рамблер/Касса', 'Пространство для оплаты билетов', [:Покупки])
  create_app(mailru, 'rambler_kino', 'Рамблер/Кино', 'Помощник покупки билетов в кино', [:Покупки])
  create_app(mailru, 'rambler_mail', 'Рамблер/Почта', 'Электронная почта', [:Инструменты])
  create_app(mailru, 'rambler_search', 'Рамблер', 'Поисковик', [:Инструменты])
  create_app(mailru, 'rambler_5stars', '5 Звезд', 'Кинотеатр', [:Развлечения])

  ozon = create_user('admin@ozon.ru', 'OZON')
  create_app(ozon, 'ozon_ozon', 'OZON', 'Онлайн гипермаркет', [:Покупки])
  create_app(ozon, 'ozon_card', 'Ozon', 'Онлайн банк', [:Финансы])
  create_app(ozon, 'ozon_courier', 'Ozon для курьеров', 'Сервис для курьеров', [:Работа])
  create_app(ozon, 'ozon_seller', 'Ozon для продавцов', 'Сервис для продавцов', [:Работа])
  create_app(ozon, 'ozon_pvz', 'Ozon ПВЗ', 'Пункт выдачи заказов', [:Работа])

  alpha = create_user('admin@alpha.ru', 'Альфа')
  create_app(alpha, 'alpha_bank', 'Альфа Банк', 'Онлайн банк', [:Финансы])

  beeline = create_user('admin@beeline.ru', 'Билайн')
  create_app(beeline, 'beeline_beeline', 'Билайн', 'Онлайн кабинет пользователя', [:Инструменты])
  create_app(beeline, 'beeline_books', 'Билайн Книги', 'Онлайн библиотека', [:Развлечения, :Книги])
  create_app(beeline, 'beeline_card', 'Билайн Карта', 'Онлайн банк', [:Финансы])
  create_app(beeline, 'beeline_cloud', 'Билайн Облако', 'Облачное хранилище', [:Инструменты])
  create_app(beeline, 'beeline_music', 'Билайн Музыка', 'Стриминговый сервис', [:Аудио, :Развлечения])
  create_app(beeline, 'beeline_radio', 'Билайн Радио', 'Онлайн радио', [:Аудио, :Развлечения])
  create_app(beeline, 'beeline_tv', 'Билайн ТВ', 'Онлайн кинотеатр и ТВ', [:Видео, :Развлечения])

  megafon = create_user('admin@megafon.ru', 'МегаФон')
  create_app(megafon, 'megafon_megafon', 'МегаФон', 'Онлайн кабинет пользователя', [:Инструменты])
  create_app(megafon, 'megafon_bank', 'МегаФон Банк', 'Онлайн банк', [:Финансы])
  create_app(megafon, 'megafon_podcasts', 'МегаФон Подкасты', 'Онлайн подкасты', [:Аудио, :Развлечения])
  create_app(megafon, 'megafon_tv', 'МегаФон ТВ', 'Онлайн кинотеатр и ТВ', [:Видео, :Развлечения])

  mts = create_user('admin@mts.ru', 'МТС')
  create_app(mts, 'mts_mts', 'МТС', 'Онлайн кабинет пользователя', [:Инструменты])
  create_app(mts, 'mts_bank', 'МТС Банк', 'Онлайн банк', [:Финансы])
  create_app(mts, 'mts_cashback', 'МТС Кешбэк', 'Поиск выгодных скидок и акций', [:Навигация, :Покупки])
  create_app(mts, 'mts_kion', 'KION', 'Онлайн кинотеатр и ТВ', [:Видео, :Развлечения])
  create_app(mts, 'mts_library', 'МТС Библиотека', 'Онлайн библиотека', [:Развлечения, :Книги])
  create_app(mts, 'mts_live', 'МТС Live', 'Афиша городских событий', [:Навигация])
  create_app(mts, 'mts_music', 'МТС Музыка', 'Музыкальный стриминговый сервис', [:Аудио, :Развлечения])
  create_app(mts, 'mts_second_memory', 'МТС Вторая память', 'Облачное хранилище', [:Инструменты])
  create_app(mts, 'mts_smart_home', 'МТС Умный дом', 'Система умного дома', [:Дом])

  mincifri = create_user('admin@mincifri.ru', 'Минцифры')
  create_app(mincifri, 'mincifri_auto', 'Госуслуги Авто', 'Сервисы для автовладельцев', [:Инструменты])
  create_app(mincifri, 'mincifri_business', 'Госуслуги Бизнес', 'Сервисы для управления бизнесом', [:Бизнес])
  create_app(mincifri, 'mincifri_gosuslugi', 'Госуслуги', 'Государственные сервисы', [:Инструменты])
  create_app(mincifri, 'mincifri_key', 'Госключ', 'Ключ электронной подписи', [:Инструменты])
  create_app(mincifri, 'mincifri_kultura', 'Госуслуги Культура', 'Гос поддержка образования', [:Социальное])
  create_app(mincifri, 'mincifri_solve', 'Госуслуги Решаем', 'Преблемы требующие внимания', [:Инструменты])

  mos = create_user('admin@mos.ru', 'Правительство Москвы')
  create_app(mos, 'mos_mosru', 'Моя Москва', 'Портал жителя Москвы', [:Инструменты])
  create_app(mos, 'mos_citizen', 'Активный гражданин', 'Вместе сделаем город лучше', [:Инструменты])
  create_app(mos, 'mos_gosuslugi', 'Госуслуги Москвы', 'Услуги правительства Москвы', [:Инструменты])
  create_app(mos, 'mos_metro', 'Мос Метро', 'Личный кабинет', [:Инструменты])
  create_app(mos, 'mos_troyka_card', 'Тройка', 'Управление картой', [:Инструменты])

  mir = create_user('admin@mir.ru', 'МИР')
  create_app(mir, 'mir_pay', 'Мир Pay', 'Платежная система Мир', [:Финансы])
  create_app(mir, 'mir_cashback', 'Привет, Мир!', 'Поиск выгодных скидок и акций', [:Навигация, :Покупки])
  create_app(mir, 'mir_sbp', 'СБП', 'Система быстрых платежей', [:Финансы])

  pochta = create_user('admin@pochta.ru', 'Почта России')
  create_app(pochta, 'pochta_pochta', 'Почта России', 'Российская почтовая служба', [:Инструменты])
  create_app(pochta, 'pochta_bank', 'Почта Банк', 'Онлайн банк', [:Финансы])
  create_app(pochta, 'pochta_jkh', 'Почта ЖКХ', 'Жилищно-коммунальное хозяйство', [:Инструменты])

  skolkovo = create_user('admin@skolkovo.ru', 'Сколково')
  create_app(skolkovo, 'skolkovo_city', 'Сколково Город', 'Сервисы технопарка', [:Инструменты])
  create_app(skolkovo, 'skolkovo_events', 'Сколково События', 'События в технопарке', [:Навигация])

  telegram = create_user('admin@telegram.ru', 'Telegram')
  create_app(telegram, 'telegram_telegram', 'Telegram', 'Современный мессенджер', [:Социальное])
  create_app(telegram, 'telegram_telegram_x', 'Telegram X', 'Мессенджер на острие прогресса', [:Социальное])

  tinkoff = create_user('admin@tinkoff.ru', 'Тинькофф')
  create_app(tinkoff, 'tinkoff_bank', 'Тинькофф Банк', 'Онлайн банк', [:Финансы])
  create_app(tinkoff, 'tinkoff_mobile', 'Тинькофф Мобайл', 'Мобильный оператор', [:Инструменты])
  create_app(tinkoff, 'tinkoff_investments', 'Тинькофф Инвестиции', 'Онлайн брокер', [:Финансы])

  citilink = create_user('admin@citilink.ru', 'Ситилинк')
  create_app(citilink, 'citilink_shop', 'Ситилинк', 'Онлайн гипермаркет', [:Покупки])

  dns = create_user('admin@dns.ru', 'DNS')
  create_app(dns, 'dns_shop', 'DNS', 'Онлайн гипермаркет', [:Покупки])

  strelka = create_user('admin@strelka.ru', 'Стрелка')
  create_app(strelka, 'strelka_card', 'Стрелка', 'Управление картой', [:Инструменты])

  svyaznoy = create_user('admin@svyaznoy.ru', 'Связной')
  create_app(svyaznoy, 'svyaznoy_shop', 'Связной', 'Магазин электроники', [:Покупки])
  create_app(svyaznoy, 'svyaznoy_tickets', 'Связной Билеты', 'Покупка билетов на транспорт', [:Покупки, :Путешествия])

  gasprombank = create_user('admin@gasprombank.ru', 'Газпромбанк')
  create_app(gasprombank, 'gasprombank_bank', 'Газпромбанк', 'Онлайн банк', [:Финансы])

  home_credit = create_user('admin@homecredit.ru', 'Хоум Кредит')
  create_app(home_credit, 'home_credit_bank', 'Хоум Кредит Банк', 'Онлайн банк', [:Финансы])

  otp = create_user('admin@otp.ru', 'ОТП')
  create_app(otp, 'otp_bank', 'ОТП Банк', 'Онлайн банк', [:Финансы])

  renaissance_credit = create_user('admin@renaissancecredit.ru', 'Ренессанс Кредит')
  create_app(renaissance_credit, 'renaissance_credit_bank', 'Ренессанс Кредит', 'Онлайн банк', [:Финансы])

  rosbank = create_user('admin@rosbank.ru', 'Росбанк')
  create_app(rosbank, 'rosbank_bank', 'Росбанк', 'Онлайн банк', [:Финансы])

  rshb = create_user('admin@rshb.ru', 'Россельхозбанк')
  create_app(rshb, 'rshb_bank', 'Россельхозбанк', 'Онлайн банк', [:Финансы])

  uralsib = create_user('admin@uralsib.ru', 'Уралсиб')
  create_app(uralsib, 'uralsib_bank', 'Уралсиб Банк', 'Онлайн банк', [:Финансы])

  kefir = create_user('admin@kefir.ru', 'Kefir')
  create_app(kefir, 'kefir_cyberika', 'Cyberika', 'Ролевая игра', [:Игры])
  create_app(kefir, 'kefir_frostborn', 'Frostborn', 'Ролевая игра', [:Игры])
  create_app(kefir, 'kefir_grim_soul', 'Grim Soul', 'Ролевая игра', [:Игры])
  create_app(kefir, 'kefir_las_day_on_earth', 'Last Day on Earth', 'Выживание', [:Игры])

  nekki = create_user('admin@nekki.ru', 'Nekki')
  create_app(nekki, 'nekki_11x11', '11x11', 'Спорт', [:Игры])
  create_app(nekki, 'nekki_lintrix', 'Lintrix', 'Пазл', [:Игры])
  create_app(nekki, 'nekki_shadow_fight', 'Shadow Fight', 'Сражение на арене', [:Игры])
  create_app(nekki, 'nekki_shadow_fight_2', 'Shadow Fight 2', 'Сражение на арене', [:Игры])
  create_app(nekki, 'nekki_shadow_fight_2_special', 'Shadow Fight 2 Special', 'Сражение на арене', [:Игры])
  create_app(nekki, 'nekki_shadow_fight_3', 'Shadow Fight 3', 'Сражение на арене', [:Игры])
  create_app(nekki, 'nekki_vector', 'Vector', 'Аркада', [:Игры])
  create_app(nekki, 'nekki_vector_2', 'Vector 2', 'Аркада', [:Игры])
  create_app(nekki, 'nekki_vector_2_premium', 'Vector 2 Premium', 'Аркада', [:Игры])

  pixonic = create_user('admin@pixonic.ru', 'Pixonic')
  create_app(pixonic, 'pixonic_dino_squad', 'Dino Squad', 'Отстрел динозваров', [:Игры])
  create_app(pixonic, 'pixonic_war_robots', 'War Robots', 'Многопользовательская битва на мехах', [:Игры])

  zeptolab = create_user('admin@zeptolab.ru', 'ZeptoLab')
  create_app(zeptolab, 'zeptolab_bullet_echo', 'Bullet Echo', 'Ролевая игра', [:Игры])
  create_app(zeptolab, 'zeptolab_cats_crash_arena', 'CATS: Crash Arena', 'Сражение на арене', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope', 'Cut the Rope', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope_2', 'Cut the Rope 2', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope_2_gold', 'Cut the Rope 2 Gold', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope_experiments_gold', 'Cut the Rope: Experiments Gold', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope_gold', 'Cut the Rope Gold', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope_magic', 'Cut the Rope: Magic', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_cut_the_rope_time_travel', 'Cut the Rope: Time Travel', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_downhill_smash', 'Downhill Smash', 'Аркада', [:Игры])
  create_app(zeptolab, 'zeptolab_evo_pop', 'Evo Pop', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_king_of_thieves', 'King of Thieves', 'Стратегия', [:Игры])
  create_app(zeptolab, 'zeptolab_om_nom_merge', 'Om Nom: Merge', 'Симуляция', [:Игры])
  create_app(zeptolab, 'zeptolab_om_nom_run', 'Om Nom: Run', 'Бег с препятствиями', [:Игры])
  create_app(zeptolab, 'zeptolab_pudding_monsters', 'Puddin Monsters', 'Пазл', [:Игры])
  create_app(zeptolab, 'zeptolab_robotics', 'Robotics!', 'Сражение на арене', [:Игры])
  create_app(zeptolab, 'zeptolab_where_is_om_nom', 'Where is Om Nom?', 'Приключение', [:Игры])

end
