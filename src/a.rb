MAX = (10**5 -1)*(10**4)

n = gets.chomp.to_i
heights = gets.chomp.split(' ').map(&:to_i)
heights = [0].concat(heights)
total_costs = Array.new(n+1, MAX)
total_costs[1] = 0
# p total_costs

total_costs.each_with_index do |total_cost, idx|
  next if idx == 0
  next if idx == 1
  total_costs[idx] = [total_costs[idx], total_costs[idx-1] + (heights[idx]-heights[idx-1]).abs, total_costs[idx-2] + (heights[idx]-heights[idx-2]).abs].min
end

# p total_costs

puts total_costs[-1]
