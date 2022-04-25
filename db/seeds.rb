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

def create_user(email, name, role = :developer)
  user = User.create!(email: email, name: name, role: role, password: '1234', password_confirmation: '1234', consent: true)

  pp "User is created: #{name}"
  user
end

def create_app(user, ref_id, title, description)
  icon_filename = "#{ref_id}.webp"

  app = user.apps.new
  app.ref_id = ref_id
  app.title = title
  app.description = description
  app.icon.attach(io: File.open(icon_uri(icon_filename)), filename: icon_filename, content_type: 'image/webp')
  app.package.attach(io: File.open(default_apk), filename: default_apk_filename)
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
  create_app(yandex, 'yandex_maps', 'Яндекс.Карты', 'Помощник в навигации')
  create_app(yandex, 'yandex_metro', 'Яндекс.Метро', 'Навигации в метро')
  create_app(yandex, 'yandex_music', 'Яндекс.Музыка', 'Слушайте музыку и радио онлайн')
  create_app(yandex, 'yandex_disk', 'Яндекс.Диск', 'Облачное хранилище')
  create_app(yandex, 'yandex_browser', 'Яндекс.Браузер', 'Приложение для серфинга в интернете')
  create_app(yandex, 'yandex_market', 'Яндекс.Маркет', 'Онлайн гипермаркет')
  create_app(yandex, 'yandex_taxi', 'Яндекс.Такси', 'Приложение для вызова такси')
  create_app(yandex, 'yandex_eda', 'Яндекс.Еда', 'Доставка еды')
  create_app(yandex, 'yandex_afisha', 'Яндекс.Афиша', 'Афиша городских событий')
  create_app(yandex, 'yandex_mail', 'Яндекс.Почта', 'Электронная почта')
  create_app(yandex, 'yandex_zen', 'Яндекс.Дзен', 'Социальная сеть')
  create_app(yandex, 'yandex_lavka', 'Яндекс.Лавка', 'Онлайн магазин продуктов питания')
  create_app(yandex, 'yandex_kinopoisk', 'Кинопоиск', 'Онлайн кинотеатр и ТВ')
  create_app(yandex, 'yandex_autoru', 'Авто.ру', 'Онлайн рынок подержанных автомобилей')
  create_app(yandex, 'yandex_eda_couriers', 'Яндекс.Еда для курьеров', 'Сервис для курьеров')
  create_app(yandex, 'yandex_eda_restaurants', 'Яндекс.Еда для ресторанов', 'Сервис для ресторанов')
  create_app(yandex, 'yandex_edadil', 'Едадил', 'Поиск выгодных скидок и акций')
  create_app(yandex, 'yandex_flights', 'Яндекс.Полеты', 'Покупка билетов на самолеты')
  create_app(yandex, 'yandex_health', 'Яндекс.Здоровье', 'Посетите врача онлайн')
  create_app(yandex, 'yandex_keyboard', 'Яндекс.Клавиатура', 'Альтернатива стандартной клавиатуре')
  create_app(yandex, 'yandex_messenger', 'Яндекс.Мессенджер', 'Онлайн мессенджер для общения')
  create_app(yandex, 'yandex_navigator', 'Яндекс.Навигатор', 'Ассистент для навигации за рулем')
  create_app(yandex, 'yandex_ofd', 'Яндекс.ОФД', 'Работа с кассовыми чеками')
  create_app(yandex, 'yandex_realty', 'Яндекс.Недвижимость', 'Ваш персональный онлайн риелтор')
  create_app(yandex, 'yandex_search', 'Яндекс', 'Самый популярный поисковик рунета')
  create_app(yandex, 'yandex_taxi_pro', 'Яндекс.Такси Pro', 'Сервис для водителей')
  create_app(yandex, 'yandex_telemost', 'Яндекс.Телемост', 'Проведение онлайн видеоконференций')
  create_app(yandex, 'yandex_trains', 'Яндекс.Поезда', 'Покупка билетов на поезда')
  create_app(yandex, 'yandex_translate', 'Яндекс.Переводчик', 'Ваш персональный переводчик')
  create_app(yandex, 'yandex_weather', 'Яндекс.Погода', 'Метеорологический ассистент')
  create_app(yandex, 'yandex_smart_home', 'Дом с Алисой', 'Система умного дома')
  create_app(yandex, 'yandex_market_sellers', 'Яндекс.Маркет для продавцов', 'Сервис для продавцов')
  create_app(yandex, 'yandex_doctor', 'Кабинет Врача', 'Сервис для врачей')
  create_app(yandex, 'yandex_radio', 'Яндекс.Радио', 'Онлайн радио')
  create_app(yandex, 'yandex_drive', 'Яндекс.Драйв', 'Каршеринг')

  mailru = create_user('admin@mail.ru', 'Mail.Ru')
  create_app(mailru, 'mailru_cloud', 'Облако Mail.Ru', 'Облачное хранилище')
  create_app(mailru, 'mailru_mail', 'Почта Mail.Ru', 'Электронная почта')
  create_app(mailru, 'mailru_classmates', 'Одноклассники', 'Социальная сеть')
  create_app(mailru, 'mailru_icq', 'ICQ', 'Онлайн мессенджер для общения')
  create_app(mailru, 'mailru_agent', 'Агент Mail.Ru', 'Онлайн мессенджер для общения')

  vk = create_user('admin@vk.ru', 'Вконтакте')
  create_app(mailru, 'vk_vk', 'VK', 'Социальная сеть')
  create_app(mailru, 'vk_apteki', 'VK Аптеки', 'Онлайн магазин лекарств')
  create_app(mailru, 'vk_calls', 'VK Calls', 'Приложение для проведения видеоконференций')
  create_app(mailru, 'vk_mail', 'VK Mail', 'Электронная почта')
  create_app(mailru, 'vk_marusya', 'VK Маруся', 'Голосовой помощник')
  create_app(mailru, 'vk_music', 'VK Музыка', 'Слушайте друг друга')
  create_app(mailru, 'vk_news', 'VK Новости', 'Читайте последние новости')
  create_app(mailru, 'vk_teams', 'VK Teams', 'Мессенджер для командной работы')
  create_app(mailru, 'vk_video', 'VK Видео', 'Онлайн кинотеатр и ТВ')
  create_app(mailru, 'vk_work', 'VK Работа', 'Поиск вакансий')
  create_app(mailru, 'vk_youla', 'Юла', 'Легко покупайте быстро продавайте')

  sber = create_user('admin@sber.ru', 'Сбер')
  create_app(mailru, 'sber_bank', 'СберБанк', 'Онлайн банк')
  create_app(mailru, 'sber_business', 'СберБизнес', 'Помощник в бизнесе')
  create_app(mailru, 'sber_citydrive', 'СитиДрайв', 'Каршеринг')
  create_app(mailru, 'sber_citymobil', 'СитиМобил', 'Приложение для вызова такси')
  create_app(mailru, 'sber_citystart', 'СитиСтарт', 'Сервис для водителей')
  create_app(mailru, 'sber_eapteka', 'еАптека', 'Онлайн магазин лекарств')
  create_app(mailru, 'sber_health', 'СберЗдоровье', 'Посетите врача онлайн')
  create_app(mailru, 'sber_logistics', 'СберЛогистика', 'Отправляйте и отслеживайте посылки онлайн')
  create_app(mailru, 'sber_samokat', 'Самокат', 'Доставка продуктов')
  create_app(mailru, 'sber_samokat_dark_store', 'Самокат Dark Store', 'Сервис для работников')
  create_app(mailru, 'sber_samokat_pro', 'Самокат Pro', 'Сервис для работников')
  create_app(mailru, 'sber_megamarket', 'СберМегаМаркет', 'Онлайн гипермаркет')
  create_app(mailru, 'sber_spasibo', 'СберСпасибо', 'Бонусная программа и кешбэк')
  create_app(mailru, 'sber_zvuk', 'СберЗвук', 'Стриминговый сервис')

  rambler = create_user('admin@rambler.ru', 'Рамблер')
  create_app(mailru, 'rambler_afisha', 'Рамблер/Афиша', 'Афиша городских событий')
  create_app(mailru, 'rambler_kassa', 'Рамблер/Касса', 'Пространство для оплаты билетов')
  create_app(mailru, 'rambler_kino', 'Рамблер/Кино', 'Помощник покупки билетов в кино')
  create_app(mailru, 'rambler_mail', 'Рамблер/Почта', 'Электронная почта')
  create_app(mailru, 'rambler_search', 'Рамблер', 'Поисковик')
  create_app(mailru, 'rambler_5stars', '5 Звезд', 'Кинотеатр')

  ozon = create_user('admin@ozon.ru', 'OZON')
  create_app(ozon, 'ozon_ozon', 'OZON', 'Онлайн гипермаркет')
  create_app(ozon, 'ozon_card', 'Ozon', 'Онлайн банк')
  create_app(ozon, 'ozon_courier', 'Ozon для курьеров', 'Сервис для курьеров')
  create_app(ozon, 'ozon_seller', 'Ozon для продавцов', 'Сервис для продавцов')
  create_app(ozon, 'ozon_pvz', 'Ozon ПВЗ', 'Пункт выдачи заказов')

  alpha = create_user('admin@alpha.ru', 'Альфа')
  create_app(alpha, 'alpha_bank', 'Альфа Банк', 'Онлайн банк')

  beeline = create_user('admin@beeline.ru', 'Билайн')
  create_app(beeline, 'beeline_beeline', 'Билайн', 'Онлайн кабинет пользователя')
  create_app(beeline, 'beeline_books', 'Билайн Книги', 'Онлайн библиотека')
  create_app(beeline, 'beeline_card', 'Билайн Карта', 'Онлайн банк')
  create_app(beeline, 'beeline_cloud', 'Билайн Облако', 'Облачное хранилище')
  create_app(beeline, 'beeline_music', 'Билайн Музыка', 'Стриминговый сервис')
  create_app(beeline, 'beeline_radio', 'Билайн Радио', 'Онлайн радио')
  create_app(beeline, 'beeline_tv', 'Билайн ТВ', 'Онлайн кинотеатр и ТВ')

  megafon = create_user('admin@megafon.ru', 'МегаФон')
  create_app(megafon, 'megafon_megafon', 'МегаФон', 'Онлайн кабинет пользователя')
  create_app(megafon, 'megafon_bank', 'МегаФон Банк', 'Онлайн банк')
  create_app(megafon, 'megafon_podcasts', 'МегаФон Подкасты', 'Онлайн подкасты')
  create_app(megafon, 'megafon_tv', 'МегаФон ТВ', 'Онлайн кинотеатр и ТВ')

  mts = create_user('admin@mts.ru', 'МТС')
  create_app(mts, 'mts_mts', 'МТС', 'Онлайн кабинет пользователя')
  create_app(mts, 'mts_bank', 'МТС Банк', 'Онлайн банк')
  create_app(mts, 'mts_cashback', 'МТС Кешбэк', 'Поиск выгодных скидок и акций')
  create_app(mts, 'mts_kion', 'KION', 'Онлайн кинотеатр и ТВ')
  create_app(mts, 'mts_library', 'МТС Библиотека', 'Онлайн библиотека')
  create_app(mts, 'mts_live', 'МТС Live', 'Афиша городских событий')
  create_app(mts, 'mts_music', 'МТС Музыка', 'Музыкальный стриминговый сервис')
  create_app(mts, 'mts_second_memory', 'МТС Вторая память', 'Облачное хранилище')
  create_app(mts, 'mts_smart_home', 'МТС Умный дом', 'Система умного дома')

  mincifri = create_user('admin@mincifri.ru', 'Минцифры')
  create_app(mincifri, 'mincifri_auto', 'Госуслуги Авто', 'Сервисы для автовладельцев')
  create_app(mincifri, 'mincifri_business', 'Госуслуги Бизнес', 'Сервисы для управления бизнесом')
  create_app(mincifri, 'mincifri_gosuslugi', 'Госуслуги', 'Государственные сервисы')
  create_app(mincifri, 'mincifri_key', 'Госключ', 'Ключ электронной подписи')
  create_app(mincifri, 'mincifri_kultura', 'Госуслуги Культура', 'Гос поддержка образования')
  create_app(mincifri, 'mincifri_solve', 'Госуслуги Решаем', 'Преблемы требующие внимания')

  mos = create_user('admin@mos.ru', 'Правительство Москвы')
  create_app(mos, 'mos_mosru', 'Моя Москва', 'Портал жителя Москвы')
  create_app(mos, 'mos_citizen', 'Активный гражданин', 'Вместе сделаем город лучше')
  create_app(mos, 'mos_gosuslugi', 'Госуслуги Москвы', 'Услуги правительства Москвы')
  create_app(mos, 'mos_metro', 'Мос Метро', 'Личный кабинет')
  create_app(mos, 'mos_troyka_card', 'Тройка', 'Управление картой')

  mir = create_user('admin@mir.ru', 'МИР')
  create_app(mir, 'mir_pay', 'Мир Pay', 'Платежная система Мир')
  create_app(mir, 'mir_cashback', 'Привет, Мир!', 'Поиск выгодных скидок и акций')
  create_app(mir, 'mir_sbp', 'СБП', 'Система быстрых платежей')

  pochta = create_user('admin@pochta.ru', 'Почта России')
  create_app(pochta, 'pochta_pochta', 'Почта России', 'Российская почтовая служба')
  create_app(pochta, 'pochta_bank', 'Почта Банк', 'Онлайн банк')
  create_app(pochta, 'pochta_jkh', 'Почта ЖКХ', 'Жилищно-коммунальное хозяйство')

  skolkovo = create_user('admin@skolkovo.ru', 'Сколково')
  create_app(skolkovo, 'skolkovo_city', 'Сколково Город', 'Сервисы технопарка')
  create_app(skolkovo, 'skolkovo_events', 'Сколково События', 'События в технопарке')

  telegram = create_user('admin@telegram.ru', 'Telegram')
  create_app(telegram, 'telegram_telegram', 'Telegram', 'Современный мессенджер')
  create_app(telegram, 'telegram_telegram_x', 'Telegram X', 'Мессенджер на острие прогресса')

  tinkoff = create_user('admin@tinkoff.ru', 'Тинькофф')
  create_app(tinkoff, 'tinkoff_bank', 'Тинькофф Банк', 'Онлайн банк')
  create_app(tinkoff, 'tinkoff_mobile', 'Тинькофф Мобайл', 'Мобильный оператор')
  create_app(tinkoff, 'tinkoff_investments', 'Тинькофф Инвестиции', 'Онлайн брокер')

  citilink = create_user('admin@citilink.ru', 'Ситилинк')
  create_app(citilink, 'citilink_shop', 'Ситилинк', 'Онлайн гипермаркет')

  dns = create_user('admin@dns.ru', 'DNS')
  create_app(dns, 'dns_shop', 'DNS', 'Онлайн гипермаркет')

  strelka = create_user('admin@strelka.ru', 'Стрелка')
  create_app(strelka, 'strelka_card', 'Стрелка', 'Управление картой')

  svyaznoy = create_user('admin@svyaznoy.ru', 'Связной')
  create_app(svyaznoy, 'svyaznoy_shop', 'Связной', 'Магазин электроники')
  create_app(svyaznoy, 'svyaznoy_tickets', 'Связной Билеты', 'Покупка билетов на транспорт')

  gasprombank = create_user('admin@gasprombank.ru', 'Газпромбанк')
  create_app(gasprombank, 'gasprombank_bank', 'Газпромбанк', 'Онлайн банк')

  home_credit = create_user('admin@homecredit.ru', 'Хоум Кредит')
  create_app(home_credit, 'home_credit_bank', 'Хоум Кредит Банк', 'Онлайн банк')

  otp = create_user('admin@otp.ru', 'ОТП')
  create_app(otp, 'otp_bank', 'ОТП Банк', 'Онлайн банк')

  renaissance_credit = create_user('admin@renaissancecredit.ru', 'Ренессанс Кредит')
  create_app(renaissance_credit, 'renaissance_credit_bank', 'Ренессанс Кредит', 'Онлайн банк')

  rosbank = create_user('admin@rosbank.ru', 'Росбанк')
  create_app(rosbank, 'rosbank_bank', 'Росбанк', 'Онлайн банк')

  rshb = create_user('admin@rshb.ru', 'Россельхозбанк')
  create_app(rshb, 'rshb_bank', 'Россельхозбанк', 'Онлайн банк')

  uralsib = create_user('admin@uralsib.ru', 'Уралсиб')
  create_app(uralsib, 'uralsib_bank', 'Уралсиб Банк', 'Онлайн банк')

  #

  kefir = create_user('admin@kefir.ru', 'Kefir')
  create_app(kefir, 'kefir_cyberika', 'Cyberika', 'Ролевая игра')
  create_app(kefir, 'kefir_frostborn', 'Frostborn', 'Ролевая игра')
  create_app(kefir, 'kefir_grim_soul', 'Grim Soul', 'Ролевая игра')
  create_app(kefir, 'kefir_las_day_on_earth', 'Last Day on Earth', 'Выживание')

  nekki = create_user('admin@nekki.ru', 'Nekki')
  create_app(nekki, 'nekki_11x11', '11x11', 'Спорт')
  create_app(nekki, 'nekki_lintrix', 'Lintrix', 'Пазл')
  create_app(nekki, 'nekki_shadow_fight', 'Shadow Fight', 'Сражение на арене')
  create_app(nekki, 'nekki_shadow_fight_2', 'Shadow Fight 2', 'Сражение на арене')
  create_app(nekki, 'nekki_shadow_fight_2_special', 'Shadow Fight 2 Special', 'Сражение на арене')
  create_app(nekki, 'nekki_shadow_fight_3', 'Shadow Fight 3', 'Сражение на арене')
  create_app(nekki, 'nekki_vector', 'Vector', 'Аркада')
  create_app(nekki, 'nekki_vector_2', 'Vector 2', 'Аркада')
  create_app(nekki, 'nekki_vector_2_premium', 'Vector 2 Premium', 'Аркада')

  pixonic = create_user('admin@pixonic.ru', 'Pixonic')
  create_app(pixonic, 'pixonic_dino_squad', 'Dino Squad', 'Отстрел динозваров')
  create_app(pixonic, 'pixonic_war_robots', 'War Robots', 'Многопользовательская битва на мехах')

  zeptolab = create_user('admin@zeptolab.ru', 'ZeptoLab')
  create_app(zeptolab, 'zeptolab_bullet_echo', 'Bullet Echo', 'Ролевая игра')
  create_app(zeptolab, 'zeptolab_cats_crash_arena', 'CATS: Crash Arena', 'Сражение на арене')
  create_app(zeptolab, 'zeptolab_cut_the_rope', 'Cut the Rope', 'Пазл')
  create_app(zeptolab, 'zeptolab_cut_the_rope_2', 'Cut the Rope 2', 'Пазл')
  create_app(zeptolab, 'zeptolab_cut_the_rope_2_gold', 'Cut the Rope 2 Gold', 'Пазл')
  create_app(zeptolab, 'zeptolab_cut_the_rope_experiments_gold', 'Cut the Rope: Experiments Gold', 'Пазл')
  create_app(zeptolab, 'zeptolab_cut_the_rope_gold', 'Cut the Rope Gold', 'Пазл')
  create_app(zeptolab, 'zeptolab_cut_the_rope_magic', 'Cut the Rope: Magic', 'Пазл')
  create_app(zeptolab, 'zeptolab_cut_the_rope_time_travel', 'Cut the Rope: Time Travel', 'Пазл')
  create_app(zeptolab, 'zeptolab_downhill_smash', 'Downhill Smash', 'Аркада')
  create_app(zeptolab, 'zeptolab_evo_pop', 'Evo Pop', 'Пазл')
  create_app(zeptolab, 'zeptolab_king_of_thieves', 'King of Thieves', 'Стратегия')
  create_app(zeptolab, 'zeptolab_om_nom_merge', 'Om Nom: Merge', 'Симуляция')
  create_app(zeptolab, 'zeptolab_om_nom_run', 'Om Nom: Run', 'Бег с препятствиями')
  create_app(zeptolab, 'zeptolab_pudding_monsters', 'Puddin Monsters', 'Пазл')
  create_app(zeptolab, 'zeptolab_robotics', 'Robotics!', 'Сражение на арене')
  create_app(zeptolab, 'zeptolab_where_is_om_nom', 'Where is Om Nom?', 'Приключение')

end
