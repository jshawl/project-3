# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.destroy_all
Response.destroy_all


question = Question.create([
  {body: 'How are you feeling?', color: '#000'},
  {body: 'How did you sleep last night?', color: '#fff'},
  {body: 'How much energy do you have?', color: '#'},
  {body: 'Early mornings?', color: '#'},
  {body: 'Late nights?', color: '#'},
  {body: 'What is your mood?', color: '#'},
  {body: 'What do you think about last year', color: '#'},
  {body: 'How has your year been?', color: '#'},
  {body: 'How has your month been?', color: '#'},
  {body: 'Sleeping in?', color: '#'}
])

response = Response.create([
  {color: '#fff', question: question[0]},
  {color: '#fff', question:question[1]}
])
