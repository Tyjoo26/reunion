require './lib/activity'

class Reunion

  attr_reader :location, :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activities(activity)
    @activities << activity
  end

  def total_cost_of_reunion
    @activities[0].participants.values.reduce(:+)
  end


end
