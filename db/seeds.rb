# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ジャンルの初期データを追加
genre1 = Genre.create(name: '初対面')
genre2 = Genre.create(name: 'デート')
genre3 = Genre.create(name: '飲み会')

genre1.topics.create(title: '一億もらったら？')
genre2.topics.create(title: 'いまはまっていること')
genre3.topics.create(title: 'おすすめのアプリ')