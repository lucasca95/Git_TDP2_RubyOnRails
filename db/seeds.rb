# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t = Target.create(name:"Arduino UNO")
e = Esp.create(mac:"A0:20:A6:00:F3:CD", version:1)
i = Issue.create(message:"No hay más yerba")
u = User.create(email:"santiagocorrao96@gmail.com",password:"123456")
