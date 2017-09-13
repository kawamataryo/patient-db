# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveSupport::JSONを使ってjsonをデコードしてrubyオブジェクトに変換
name_list = ActiveSupport::JSON.decode(File.read('db/name_list.json'))
history_list = ActiveSupport::JSON.decode(File.read('db/history_list.json'))
user_list = ActiveSupport::JSON.decode(File.read('db/user_list.json'))

# seedsの設定
name_list.each do |data|
    Patient.create(
        patient_id:data['id'],
        name:data['name1'],
        kana:data['name2'],
        sex:data['sex'],
        birthdate:data['birthdate'],
        phone:data['phone_num'],
        post_code:data['zip'],
        address:data['address'],
        reason:data['ad'],
        experience:data['experience'],
        firstday:data['firstday'],
        memo:data['memo'],
    )
end

history_list.each do |data|
    History.create(
        history_date:data['history_date'],
        patient_id:data['id'],
        patient_name:data['name'],
        sales:data['sales'],
    )
end

user_list.each do |data|
    user = User.new(:email => data['email'], :password => data['pass'])
    user.save!
end
