# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tool.destroy_all

hammer = Tool.create(name: "Hammer", price: 3.99, quantity: 2)
screwdriver = Tool.create(name: "Screwdriver", price: 1.50, quantity: 3)
drill = Tool.create(name: "Drill", price: 13.75, quantity: 1)
saw = Tool.create(name: "Saw", price: 12.99, quantity: 5)
nail = Tool.create(name: "Nail", price: 2.99, quantity: 40)
measuring_tape = Tool.create(name: "Measuring Tape", price: 7.00, quantity: 1)
