require 'pry'

class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end


  def add_participants(participant)
    @participants.merge!(participant)
  end


  def total_cost_of_activity
    @participants.values.reduce(:+)
  end

  def split_cost_of_activity
    divisible_num = @participants.keys.count
    total_cost_of_activity / divisible_num
  end

  def find_what_is_owed
    owed = @participants.values.map do |value|
      split_cost_of_activity - value
    end
    owed
  end

  def match_what_is_owed_with_participant
    @participants.keys.zip(find_what_is_owed)
  end

end
