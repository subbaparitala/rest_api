# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: 'user', password: 'password')
u2 = User.create(username: 'user2', password: 'password')
 
p1 = u1.posts.create(content: 'First Post')
p2 = u1.posts.create(content: 'Second Post')
 
p3 = u2.posts.create(content: 'Third Post')
p4 = u2.posts.create(content: 'Fourth Post')