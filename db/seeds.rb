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

User.create(email: 'test@gmail.com', password: 'password',admin: true)
areas = Area.create!([
  { name: "北区" },
  { name: "東山区" },
  { name: "西京区" },
  { name: "南区" },
  { name: "上京区" },
  { name: "中京区" },
  { name: "左京区" },
  { name: "右京区" },
  { name: "下京区" },
  { name: "伏見区" },
  { name: "山科区" }
])

dayofweeks = DayOfWeek.create!([
  { name: "月" },
  { name: "火" },
  { name: "水" },
  { name: "木" },
  { name: "金" },
  { name: "土" },
  { name: "日" },
  { name: "祝" }
])
