# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: "gerenteds@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             rol: "gerente_ds")

User.create!(email: "asistenteadministracion@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             rol: "asistente_administracion")

4.times do |n|
  # name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  rol = "basico"
  User.create!(email: email,
               password:              password,
               password_confirmation: password,
               rol: rol)
end

5.times do |n|
  name      = Faker::Name.name
  apellido  = Faker::Name.last_name
  cedula    = "18.797.88"<<n.to_s
  direccion = Faker::Address.street_name
  telefono_casa = "0274263517"<<n.to_s
  telefono_celular= "0414747530"<<n.to_s
  sexo = 'M'
  fecha_nacimiento= 30.year.ago

  Personal.create!( nombre: name,
  apellido: apellido,
  cedula: cedula,
  direccion: direccion,
  telefono_casa: telefono_casa ,
  telefono_celular: telefono_celular,
  sexo: sexo,
  fecha_nacimiento:fecha_nacimiento
  )
end