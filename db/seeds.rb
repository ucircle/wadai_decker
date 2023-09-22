# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'wadai@com',
   password: 'wadaidecker'
)

# ジャンルの初期データを追加
genre1 = Genre.create(name: '初対面')
genre1.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'sakura.webp')), filename: 'sakura.webp')
genre2 = Genre.create(name: '恋愛')
genre2.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'rennai.webp')), filename: 'rennai.webp')
genre3 = Genre.create(name: '学校')
genre3.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'gakkou.webp')), filename: 'gakkou.webp')
genre4 = Genre.create(name: '生活')
genre4.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'seikatu.webp')), filename: 'seikatu.jpg')
genre5 = Genre.create(name: '悩み')
genre5.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'nayami.webp')), filename: 'nayami.webp')
genre6 = Genre.create(name: 'ユーモア')
genre6.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'yu-moa.jpg')), filename: 'yu-moa.jpg')

genre1.topics.create(title: '最近ハマっている趣味は？')
genre1.topics.create(title: '休日の過ごし方は？')
genre1.topics.create(title: '好きな食べ物は？')

genre2.topics.create(title: '好きな異性のしぐさ')
genre2.topics.create(title: 'バレンタインの思い出')
genre2.topics.create(title: '理想のプロポーズ')

genre3.topics.create(title: '学校で流行った遊び')
genre3.topics.create(title: '好きだった給食')
genre3.topics.create(title: '担任の先生の思い出')

genre4.topics.create(title: '私服のこだわり')
genre4.topics.create(title: 'おすすめのアプリ')
genre4.topics.create(title: '得意料理')

genre5.topics.create(title: '十年後、どうなっていたい？')
genre5.topics.create(title: '自分の悪いクセ')
genre5.topics.create(title: '職場の嫌なところ')

genre6.topics.create(title: '一億円あったら何に使う？')
genre6.topics.create(title: '明日が地球最後の日！何をして過ごす？')
genre6.topics.create(title: '一生同じ食べ物しか食べられなくなった！何なら許せる？')