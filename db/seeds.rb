
Faker::Config.locale = :ja

sex = ['男性', '女性']
symptom = %w(肩こり 腰痛 首の痛み 背中の痛み 腕の痛み 足の痛み 頭痛 顔面 眼科系 耳鼻科系 自律神経 内科系 婦人科系 不妊治療 精神疾患 その他)
reason = %w(ホームページ チラシ 口コミ 知人)
experience = %w(あり なし)



# 患者情報
(1..900).each do |i|
  gimei = Gimei.name
  Patient.create(
    patient_id: i,
    name: gimei.kanji,
    kana: gimei.hiragana,
    sex: sex.sample,
    birthdate: Faker::Time.between(90.years.ago, 1.years.ago, :all).to_s[0, 10],
    phone: Faker::PhoneNumber.phone_number,
    post_code: Faker::Number.number(3) + '-' + Faker::Number.number(4),
    address: Faker::Address.city + Faker::Address.building_number,
    reason: reason.sample,
    experience: experience.sample,
    firstday: Faker::Time.between(5.years.ago, 1.day.ago, :all).to_s[0, 10],
    email: Faker::Internet.email,
    symptom: symptom.sample,
    memo: Yoshida::Text.sentence
  )
end

# 来院履歴
(1..9000).each do |i|
  History.create(
    history_date: Faker::Time.between(5.years.ago, 1.day.ago, :all).to_s[0, 10],
    patient_id: Faker::Number.between(1, 900),
    patient_name: Faker::Name.name,
    sales: 4000
  )
end

# 認証情報
user = User.new(email: "hoge@hoge.com", password: "hogehoge")
user.save!
