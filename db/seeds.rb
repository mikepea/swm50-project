# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all 
Role.delete_all 

Review.delete_all 
Dish.delete_all 
LocationDescription.delete_all 
Location.delete_all 
City.delete_all 

admin      = Role.create(:name => "admin", :description => "Site Admin - full permissions")
full_mod   = Role.create(:name => "full_moderator", :description => "Can edit/delete all user-generated content in system")
loc_mod    = Role.create(:name => "location_moderator", :description => "Can edit/delete locations, dishes, and reviews")
dish_mod   = Role.create(:name => "dish_moderator", :description => "Can edit/delete dishes and reviews")
review_mod = Role.create(:name => "review_moderator", :description => "Can edit/delete reviews")
gen_user   = Role.create(:name => "general_user", :description => "Normal user")

u_admin = User.create(:username => "admin", :email => "mike+ryr_admin@semantico.com", :name => "Admin", :password => "erowngewiub", :password_confirmation => "erowngewiub", :role_id => admin.id )
User.create(:username => "full_mod", :email => "mike+ryr_full_mod@semantico.com", :name => "Full Moderator", :password => "repkonop", :password_confirmation => "repkonop", :role_id => full_mod.id )
User.create(:username => "loc_mod", :email => "mike+ryr_loc_mod@semantico.com", :name => "Location Moderator", :password => "repkonop", :password_confirmation => "repkonop", :role_id => loc_mod.id )
User.create(:username => "dish_mod", :email => "mike+ryr_dish_mod@semantico.com", :name => "Dish Moderator", :password => "repkonop", :password_confirmation => "repkonop", :role_id => dish_mod.id )
User.create(:username => "review_mod", :email => "mike+ryr_review_mod@semantico.com", :name => "Review Moderator", :password => "repkonop", :password_confirmation => "repkonop", :role_id => review_mod.id )
User.create(:username => "mike", :email => "mike.pountney@gmail.com", :name => "Mike Pountney", :password => "wibblewobble", :password_confirmation => "wibblewobble", :role_id => gen_user.id )

brighton = City.create(:name => 'Brighton', :user_id => u_admin.id )
hove = City.create(:name => 'Hove', :user_id => u_admin.id )
shoreham = City.create(:name => 'Shoreham', :user_id => u_admin.id )
falmer = City.create(:name => 'Falmer', :user_id => u_admin.id )
rottingdean = City.create(:name => 'Rottingdean', :user_id => u_admin.id )
woodingdean = City.create(:name => 'Woodingdean', :user_id => u_admin.id )
patcham = City.create(:name => 'Patcham', :user_id => u_admin.id )
worthing = City.create(:name => 'Worthing', :user_id => u_admin.id )

Location.create(:name => 'The Hampton', :address1 => '57 Upper North Street', :phone => '01273 731347', :postcode => 'BN1 3FH', :city_id => brighton, :user_id => u_admin.id)
Location.create(:name => 'The Windmill', :address1 => '69 Upper North Street', :phone => '01273 202475', :postcode => 'BN1 3FL', :city_id => brighton, :user_id => u_admin.id)
Location.create(:name => 'The Swan Inn', :address1 => 'Middle Street', :phone => '01273 681842', :postcode => 'BN1 9PD', :city_id => falmer, :user_id => u_admin.id)
