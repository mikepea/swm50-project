# coding: utf-8
require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def new_city(name) 
      City.new(:name => name)
  end

  test "city with really long name is invalid" do
    city = City.new(:name => "Really long city name that just goes on for ever and ever and ever andever andever andever andever andever andever andever andever andever andever andever andever and ever")
    assert city.invalid?
  end

  test "city with newlined name is invalid" do
    city = City.new(:name => "Testtown
                            Trumpton")
    assert city.invalid?
  end

  test "city name" do 
    ok = [   "Mytown", 
             "Tally Ho!", 
             "Witch'y Cross",
            ]
    bad = [ "My;City", "My|City", "C<em>i</em>ty", "Teßtcity" ]

    ok.each do |name| 
        assert new_city(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name| 
        assert new_city(name).invalid?, "#{name} shouldn't be valid"
    end 

  end

end
