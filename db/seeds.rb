# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.destroy_all


Ingredient.destroy_all

Project.destroy_all










macbook = Ingredient.create(url: "https://www.amazon.com/Apple-MacBook-13-inch-256GB-Storage/dp/B08N5LLDSG/ref=sr_1_3?dchild=1&keywords=macbook+pro&qid=1631759803&sr=8-3", price: 1149.99, name: "macbook_pro")


macbook = Ingredient.create(url: "https://www.amazon.com/Wacom-Cintiq-Drawing-Tablet-DTK1660K0A/dp/B07L77GTTY/ref=sr_1_3?dchild=1&keywords=cintiq&qid=1631775052&sr=8-3", price: 649.95, name: "Wacom Cyntiq Tablet")






art = Category.create(name: "Art")

mechanical = Category.create(name: "Mechanics")

software = Category.create(name: "Software")

nature = Category.create(name: "Nature")

political = Category.create(name: "Politics")


political = Category.create(name: "Social")


political = Category.create(name: "Economic")


animation = Project.create(name: "Animation", description: "Super hero animatiob project", total_price: 1234)




animation.ingredients << macbook