# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "admin", login: "admin", password: "12345678")
Work.create(name: "测试作品", student_names: %w(张三 李四 王五 找刘 陈七), enroll_year: 2020, major: :computer_science, category: :social, client_type: :mobile)