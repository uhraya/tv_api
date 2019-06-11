# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ShowType.create([{name: 'News'}, {name: 'Documentary'}, {name: 'Gameshow'}, {name: 'Series'}])
Show.create([{title: 'Tagesschau', show_type_id: 1, description: 'Brings the news of the day'},{title: 'Nature is scary', show_type_id: 2, description: 'A Nature Documentary, about how nature is a very scary place'},{title: 'The price is right', show_type_id: 3, description: 'Guess the Price and win big!'}, {name: 'Game of Thrones', show_type_id: 4, description: 'Travel to the fictional continent of Westeros, where powerful families are at war for the Iron Throne'}])
Episode.create([{title: 'Tagesschau 10.6.2019', season: 40, episode: 1, number: 14240, show_id: 1, description: 'News of the day', length: 00:20:00},{},{},{}])
