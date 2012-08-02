# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(:email => 'alxjrvs@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :fname => 'Alex', :lname => 'Jarvis',:admin => true)

normal_user = User.create(:email => 'shoopdewoop@gmail.com', :password => 'foobar', :password_confirmation => 'foobar', :fname => 'Dharmeeshta', :lname => 'Rude',:admin => false)

learn_ruby = Quest.create(:title => 'Learn Ruby', :description => "Here are 30 easy steps to becoming a ruby mastermind!", :user => normal_user)
learn_guitar = Quest.create(:title => 'Learn Guitar', :description => "It's not how many years you play, it's how many hours.", :user => admin)
learn_ruby.save
learn_guitar.save

def objective_create(quest)
  (1..4).each do |f|
    quest.objectives.create(:title => "#{quest.title} Objective #{f}", :description => "This is where a description goes", :exp => 25)
  end
  quest.update_attribute(:published, true)
end

objective_create(learn_ruby)
objective_create(learn_guitar)

