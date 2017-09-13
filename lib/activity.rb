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
    sum = @participants.values.reduce(:+)
    divisible_num = @participants.keys.count
    sum / divisible_num
  end

  def find_what_is_owed_for_charlie
    owed = @participants.values.map do |value|
      split_cost_of_activity - value
    end
    owed[0]
  end

  def find_what_is_owed_for_james
    owed = @participants.values.map do |value|
      split_cost_of_activity - value
    end
    owed[1]
  end


end
