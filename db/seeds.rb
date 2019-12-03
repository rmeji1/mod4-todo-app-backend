# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Project.destroy_all

emir = User.create(username: 'emskaplann')
rob = User.create(username: 'rmejia')

Project.create({
  "name": "Some name",
  "description": 'Test project number one for our project.',
  "deadline": 02-12-2019,
  "priority": "low",
  user: emir    
})