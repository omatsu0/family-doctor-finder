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

User.create(email: 'test@gmail.com', password: 'password')
Clinic.create!(clinic_name: "田中病院" ,clinic_furigana: "たなかびょういん" ,clinic_admin_number: "右51" ,director_name:"田中太郎" ,phone_number:"123-456-7890" ,introduction: "全力尽くします" ,user_id: "1" ,pdf: "1234")
ClinicDepartment.create!(clinic_id: "1", department_id: "1")

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
  { day_of_week: "月" },
  { day_of_week: "火" },
  { day_of_week: "水" },
  { day_of_week: "木" },
  { day_of_week: "金" },
  { day_of_week: "土" },
  { day_of_week: "日" },
  { day_of_week: "祝" }
])

ConsultationHour.create!(start_at: "2012-10-08 15:28:12", end_at: "2012-10-08 17:28:12", clinic_id: "1", day_of_week_id: "1")