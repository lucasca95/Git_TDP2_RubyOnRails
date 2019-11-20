# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t = Target.create(name:"Arduino UNO")
e = Esp.create(mac:"AA:BB:CC:DD:EE:FF", version:1)
d = Device.create(name:"Arduino Catedra",latitude:0,longitude:0,esp_id:e.id,target_id:t.id)
p = Program.create(name:"Blinky 500", description:"EL BLINKY QUE BLINKEA")
p.targets << t
d.programs << p
Version.create(number:1,changelog:"Nada", program_id:p.id)
i = Issue.create(message:"No hay más yerba")