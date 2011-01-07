# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Dish.delete_all 
Location.delete_all 
LocationDescription.delete_all 
City.delete_all 
User.delete_all 
Review.delete_all 

user = User.create(:username => "admin", :name => "Admin", :password => "erowngewiub", :password_confirmation => "erowngewiub" )

city = City.create(:name => 'Brighton', :user_id => user.id )
city = City.create(:name => 'Hove', :user_id => user.id )
city = City.create(:name => 'Shoreham', :user_id => user.id )
city = City.create(:name => 'Falmer', :user_id => user.id )
city = City.create(:name => 'Rottingdean', :user_id => user.id )
city = City.create(:name => 'Woodingdean', :user_id => user.id )
city = City.create(:name => 'Patcham', :user_id => user.id )
city = City.create(:name => 'Worthing', :user_id => user.id )

Location.create(:name => 'The Hampton', :postcode => 'BN1 3XX', :city_id => city, :user_id => user)
