# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_categories 
    exercises = ['Running', 'Walking', 'Cycling', 'Swimming', 'Elliptical', 'Rowing', 
    'Circuit training', 'HIIT Training', 'Weight training', 'Core training']

    exercises.each do |name|
        Category.create(name: name)
    end
end

seed_categories