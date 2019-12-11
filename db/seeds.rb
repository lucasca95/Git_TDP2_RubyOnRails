# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t = Target.create(name:"Arduino UNO")
e = Esp.create(mac:"A0:20:A6:00:F3:CD", version:1)
d = Device.create(name:"Arduino Catedra",latitude:0,longitude:0,esp_id:e.id,target_id:t.id)
p = Program.create(name:"Blinky", description:"EL BLINKY QUE BLINKEA")
p.targets << t
v = Version.create(number:1,changelog:"500", program_id:p.id)
p.versions << v
i = Issue.create(message:"No hay más yerba")
u = User.create(email:"santiagocorrao96@gmail.com",password:"123456")
dv = Device.last.device_versions.build(version_id:1,state:1)
dv.save