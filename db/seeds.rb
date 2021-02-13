# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


stu = User.create(name: "stu", email: "stu@yahoo.com", password: "dairy")
jo = User.create(name: "jo", email: "jo@yahoo.com", password: "vegan")

math = Course.create(name: "calculus", subject: "math", teacher: "mr.kay")
tom = Course.create(name: "jerry", subject: "science", teacher: "mr.kay")

stu.notes.create(content:"yolo")
