# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.destroy_all


User.destroy_all

amy = User.create(name: "amy", password: "barnes")

comic_book = Project.create(description: "super hero comic_book project", name: "CoderMan")


art = Category.create(name: "Art")

amy.projects << comic_book

mechanical = Category.create(name: "Mechanics")

software = Category.create(name: "Software")

nature = Category.create(name: "Nature")

political = Category.create(name: "Politics")


political = Category.create(name: "Social")


political = Category.create(name: "Economic")







