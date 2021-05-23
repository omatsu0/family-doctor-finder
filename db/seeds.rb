# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

departments = Department.create!([
  { department_name: "総合内科" },
  { department_name: "外科" },
  { department_name: "小児科" },
  { department_name: "心療内科" },
  { department_name: "呼吸器外科" },
  { department_name: "形成外科" },
  { department_name: "リハビリテーション科" },
  { department_name: "放射線科" },
  { department_name: "歯科" },
  { department_name: "心臓外科" },
  { department_name: "耳鼻咽喉科" },
  { department_name: "糖尿病内科" },
  { department_name: "腎臓内科・透析センター" },
  { department_name: "感染症内科" },
  { department_name: "消化器内科" },
  { department_name: "眼科" }
])