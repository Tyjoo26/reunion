require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new(location)

    assert_instance_of Reunion, reunion
  end

  def test_has_location
    reunion = Reunion.new("California")

    assert_equal "California", reunion.location
  end

  def test_reunion_has_activities
    reunion = Reunion.new("California")
    activity = Activity.new("Basketball")
    reunion.add_activities(activity)

    assert_instance_of Activity, reunion.activities[0]
  end

  def test_total_cost_of_reunion
    activity = Activity.new("Basketball")
    participant = {"Charlie" => 20}
    activity.add_participants(participant)
    participant = {"James" => 30}
    activity.add_participants(participant)
    reunion = Reunion.new("California")
    reunion.add_activities(activity)

    assert_equal 50, reunion.total_cost_of_reunion
  end
end
