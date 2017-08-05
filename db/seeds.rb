# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Generate a user
user = User.create name: 'John', email: 'johndoe@gmail.co', password: 'password'

# Generate a couple links
Link.create url: 'http://graphql.org/', description: 'The Best Query Language', user: user
Link.create url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client', user: user
