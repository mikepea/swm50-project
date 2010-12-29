# coding: utf-8
require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "location must have a name" do
    location = Location.new
    assert location.invalid?
    assert location.errors[:name].any?
  end

  test "location with just text name is valid" do
    location = Location.new(:name => "Testpub")
    assert location.valid?
  end

  test "location with Unicode name is invalid" do
    location = Location.new(:name => "Teßtpub")
    assert location.invalid?
  end

  test "location with newlined name is invalid" do
    location = Location.new(:name => "Testpub
                            Trumpton")
    assert location.invalid?
  end

  test "location with really long name is invalid" do
    location = Location.new(:name => "Really long pub name that just goes on for ever and ever and ever andever andever andever andever andever andever andever andever andever andever andever andever and ever")
    assert location.invalid?
  end

  def new_location(name) 
      Location.new(:name => name)
  end

  test "location name" do 
    ok = [   "Mypub", 
             "Shakespeare's Head", 
             "Tally Ho! Tavern", 
             "The Lion and Lobster",
             "Generic Pub 01"
            ]
    bad = [ "My;Pub", "My|Pub", "P<em>u</em>b", "Teßtpub" ]

    ok.each do |name| 
        assert new_location(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name| 
        assert new_location(name).invalid?, "#{name} shouldn't be valid"
    end 

  end

end
