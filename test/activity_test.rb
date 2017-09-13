require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_does_it_exist
    activity = Activity.new(name)

    assert_instance_of Activity, activity
  end

  def test_does_it_have_name
    activity = Activity.new("Basketball")

    assert_equal "Basketball", activity.name
  end

  def test_does_it_have_participants
    activity = Activity.new("Basketball")
    participant = {"Charlie" => 20}

    activity.add_participants(participant)

    assert_equal "Charlie", activity.participants.keys[0]
  end

  def test_total_cost_of_activity
    activity = Activity.new("Basketball")
    participant = {"Charlie" => 20}
    activity.add_participants(participant)
    participant = {"James" => 30}
    activity.add_participants(participant)

    assert_equal 50, activity.total_cost_of_activity
  end

  def test_split_cost_of_activity
    activity = Activity.new("Basketball")
    participant = {"Charlie" => 20}
    activity.add_participants(participant)
    participant = {"James" => 30}
    activity.add_participants(participant)

    assert_equal 25, activity.split_cost_of_activity
  end

  def test_find_what_is_owed
    activity = Activity.new("Basketball")
    participant = {"Charlie" => 20}
    activity.add_participants(participant)
    participant = {"James" => 30}
    activity.add_participants(participant)

    assert_equal [5, -5], activity.find_what_is_owed
  end

  def test_match_what_is_owed_with_participant
    activity = Activity.new("Basketball")
    participant = {"Charlie" => 20}
    activity.add_participants(participant)
    participant = {"James" => 30}
    activity.add_participants(participant)

    assert_equal 5, activity.match_what_is_owed_with_participant[0][1]
    assert_equal -5, activity.match_what_is_owed_with_participant[1][1]
  end


end
