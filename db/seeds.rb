# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.destroy_all
Answer.destroy_all
Response.destroy_all

user = User.create(email: "text@text.com", password: "thisisapassword")
question = Question.create(question: "How are you feeling?")
answer = Answer.create(value: "red", user: user, question: question)
