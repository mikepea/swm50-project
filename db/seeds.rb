# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Dish.delete_all 
Location.delete_all 
City.delete_all 

City.create(:name => 'Brighton')
Location.create(:name => 'The Hampton', :postcode => 'BN1 3XX')
Location.create(:name => 'The Windmill', :postcode => 'BN1 3XY')
Dish.create(:name => 'Lamb Roast',
            :description => %{<p>
<p>Well cooked lamb, with: </p>
<ul> 
<li>3 Roast Potatoes</li> 
<li>Cauliflower Cheese</li> 
<li>Nice veg mix</li> 
</ul> 
<p>Well presented with a selection of condiments</p>
})
