# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category
# Category.create(:name => "(null)")

# Category.create(:name => "学生")
# Category.create(:name => "少年")
# Category.create(:name => "少女")
# Category.create(:name => "大人")
# Category.create(:name => "男性")
# Category.create(:name => "女性")
# Category.create(:name => "虚構")
# Category.create(:name => "造物")
# Category.create(:name => "動物")
# Category.create(:name => "樹木")
# Category.create(:name => "妹")

require "csv"

CSV.foreach('db/seeds/座の一覧(新).csv', headers: true) do |row|
  Za.create(
    name: row['名称'],
    paranoia_limit: row['不安臨界'],
    # image_id: row['画像名'],
    image: File.open("./app/assets/images/#{row['画像名']}")
  )
end
