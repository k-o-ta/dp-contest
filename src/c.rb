# class Activity
#   attr_reader :a, :b, :c
#   def initialize(costs)
#     @a = costs[0]
#     @b = costs[1]
#     @c = costs[2]
#   end
# end

MAX = (10**5 - 1)*(10**4)

n = gets.chomp.to_i
activities = []
n.times do
  activity = gets.chomp.split(' ').map(&:to_i)
  activities.push({a: activity[0], b: activity[1], c: activity[2]})
end
activities = [{a: 0, b: 0, c: 0}].concat(activities)
# p activities

total_utilities = Array.new(n+1).map{|_| {a: 0, b: 0, c: 0}}
total_utilities[1] = {a: activities[1][:a], b: activities[1][:b], c: activities[1][:c]}
# p total_utilities
# p total_costs

ACTIVITY_KIND = [:a, :b, :c]
total_utilities.each_with_index do |total_utility, idx|
  # p "#{idx}: id: #{total_utility.object_id}"
  # p idx, total_utilities
  # p total_utility
  next if idx == 0
  next if idx == 1
  previous_total_utility = total_utilities[idx-1]
  ACTIVITY_KIND.each do |activity|
    activity_1, activity_2 = ACTIVITY_KIND.grep_v(activity)
    # p previous_total_utility
    # p "#{activity_1}, #{activity_2}"
    # p "#{activity}: cur(#{total_utility.object_id}): #{total_utility}, pre(#{previous_total_utility.object_id}): #{previous_total_utility}"
    # p previous_total_utility
    total_utility[activity] = [previous_total_utility[activity_1], previous_total_utility[activity_2]].max + activities[idx][activity]
    # p total_utility
  end
end

# p total_utilities
puts [total_utilities[-1][:a],total_utilities[-1][:b], total_utilities[-1][:c]].max
# puts total_costs[-1]
