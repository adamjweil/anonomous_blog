require 'faker'
Tag.delete_all
Entry.delete_all

5.times do
  Tag.create(name: Faker::GameOfThrones.house)
end

10.times do
  Entry.create(body: Faker::Lorem.sentence(5),
               title: Faker::Lorem.words(4),
               author: Faker::GameOfThrones.character)
end
