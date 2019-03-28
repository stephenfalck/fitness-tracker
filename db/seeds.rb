# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#def seed_users
#    user_id = 0
#    10.times do 
#    User.create(
#      name: "test#{user_id}",
#      email: "test#{user_id}@test.com",
#      password: '123456',
#      password_confirmation: '123456'
#    )
#    user_id = user_id + 1
#  end
#end

def seed_categories 
    exercises = ['Running', 'Walking', 'Cycling', 'Swimming', 'Elliptical', 'Rowing', 
    'Circuit training', 'HIIT Training', 'Weight training', 'Core training']

    exercises.each do |name|
        Category.create(name: name)
    end
end

#def seed_activities
#    categories = Category.all
#
#    categories.each do |category|
#        5.times do
#          Post.create(
#            duration: rand(15..60),
#            date: '2019-01-15',
#            user_id: rand(1..9), 
#            category_id: category.id
#          )
#        end
#      end




seed_categories