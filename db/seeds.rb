# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# CSV.foreach('db/seeds/座の一覧(新).csv', headers: true) do |row|
#   Za.create(
#     name: row['名称'],
#     paranoia_limit: row['不安臨界'],
#     image: File.open("./app/assets/images/#{row['画像名']}")
#   )
# end

# CSV.foreach('db/seeds/分類の一覧.csv', headers: true) do |row|
#   Category.create(
#     name: row['名称'],
#   )
# end

# CSV.foreach('db/seeds/座分類交差テーブルの一覧.csv', headers: true) do |row|
#   ZaCategoryAttribution.create(
#     za_id: row['座id'],
#     category_id: row['分類id']
#   )
# end

# CSV.foreach('db/seeds/役職の一覧.csv', headers: true) do |row|
#   Position.create(
#     name: row['名称'],
#     max: row['最大'],
#     refusal: row['友好無視'].to_i,
#     unkillable: row['不死'].to_i,
#     obstinate: row['絶対犯'].to_i
#   )
# end

# CSV.foreach('db/seeds/ルールの一覧.csv', headers: true) do |row|
#   Rule.create(
#     name: row['名称'],
#     xy: row['字'].to_i
#   )
# end

# CSV.foreach('db/seeds/ルール役職交差テーブルの一覧.csv', headers: true) do |row|
#   RulePositionOwn.create(
#     rule_id: row['ルールid'],
#     position_id: row['役職id']
#   )
# end

