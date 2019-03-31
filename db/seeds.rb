# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_categories 
    exercises = [
        ['Running', 'running-1705716_1280.jpg'],
        ['Walking', 'walking343.jpg'],
        ['Cycling', 'cycling5435.jpg'],
        ['Swimming', 'swimming6534.jpg'],
        ['Elliptical', 'elliptical38247.jpg'],
        ['Rowing', 'rowing-machine423.jpg'], 
        ['Circuit training', 'circuit-training5432.jpg'],
        ['HIIT Training', 'exercive-ropes.jpg'],
        ['Weight training', 'barbell-equipment-exercise-equipment-949132.jpg'],
        ['Core training', 'core-exercise247y.jpg']]

    exercises.each do |name, image|
        Category.create(name: name, image: image)
    end
end

seed_categories