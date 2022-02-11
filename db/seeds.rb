# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach('db/seeds/座の一覧.csv', headers: true) do |row|
  Za.create(
    name: row['名称'],
    paranoia_limit: row['不安臨界'],
    image: File.open("./app/assets/images/#{row['画像名']}"),
    first_location: row['初期位置']
  )
end

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

# CSV.foreach('db/seeds/犯罪の一覧.csv', headers: true) do |row|
#   Crime.create(
#     name: row['名称'],
#     shift: row['臨界補正'],
#     counter: row['カウンター'].to_i
#   )
# end

# CSV.foreach('db/seeds/惨劇セットの一覧.csv', headers: true) do |row|
#   Package.create(
#     name: row['名称']
#   )
# end

# # PackageRuleOwnの関連付けに'belongs_to :crime'が含まれていたので、それが原因かもしれない
# # やっぱダメだった

# CSV.foreach('db/seeds/PackageRuleOwn.csv', headers: true) do |row|
#   Paruo.create(
#     package_id: row['惨劇セットid'],
#     rule_id: row['ルールid']
#   )
# end

# CSV.foreach('db/seeds/PackagePositionOwn.csv', headers: true) do |row|
#   PackagePositionOwn.create(
#     package_id: row['惨劇セットid'],
#     position_id: row['役職id']
#   )
# end

# CSV.foreach('db/seeds/PackageCrimeOwn.csv', headers: true) do |row|
#   PackageCrimeOwn.create(
#     package_id: row['惨劇セットid'],
#     crime_id: row['犯罪id']
#   )
# end

# # Pawnに続きIncidentにも番兵が必要になったので、脚本一覧に不純物が混ざるのは覚悟の上で脚本レベルの番兵を作った

# Script.create!(
#   name: "番兵",
#   package_id: 1,
#   noof_days: 1,
#   noof_weeks: 1
# )

# Pawn.create!(
#   script_id: 1,
#   za_id: 35,
#   position_id: 1
# )

# Incident.create!(
#   day: 1,
#   script_id: 1,
#   pawn_id: 1,
#   crime_id: 1
# )