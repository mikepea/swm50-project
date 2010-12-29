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
    location = Location.new(:name => "Testtown")
    assert location.valid?
  end

  test "location with Unicode name is valid" do
    location = Location.new(:name => "Teßttown")
    assert location.valid?
  end

  test "location with newlined name is invalid" do
    location = Location.new(:name => "Testtown
                            Trumpton")
    assert location.invalid?
  end

  test "location with ; in name is invalid" do
    location = Location.new(:name => "Test; town")
    assert location.invalid?
  end

  test "location with | in name is invalid" do
    location = Location.new(:name => "Test; town")
    assert location.invalid?
  end

  test "location with < in name is invalid" do
    location = Location.new(:name => "Test; town")
    assert location.invalid?
  end

end
