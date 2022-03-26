s = gets.chomp
t = gets.chomp
s_size = s.size
t_size = t.size

# dp = [Array.new(t.size+1,0)]
dp = (0..(s_size)).map{|| Array.new(t_size+1, 0)}

(1..(s_size)).each do |i|
  # inner = Array.new(t.size+1, 0)
  (1..(t_size)).each do |j|
    if s[i-1] == t[j-1] 
      # inner.push(dp[i-1][j-1] + 1) 
      dp[i][j] = dp[i-1][j-1] + 1
    else
      # p "i: #{i}, j: #{j}, dp: #{dp}"
      # inner.push([dp[i-1][j], inner[j-1]].max)
      dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
    end
  end
  # dp.push(inner)
end

p dp
longest = dp[-1][-1]
# p longest 
answer = Array.new(longest, "")
i = s.size
j = t.size
while longest > 0
  if(s[i-1] == t[j-1])
    answer[longest-1] = s[i-1]
# p "i: #{i}, j: #{j},answer: #{answer}"
    longest -= 1
    i -= 1
    j -= 1
  elsif dp[i][j] == dp[i-1][j]
    i -= 1
  elsif dp[i][j] == dp[i][j-1]
    j -= 1
  else
    # p "i: #{i}, j: #{j}, dp[i][j]: #{dp[i][j]}, dp[i-1][j]: #{dp[i-1][j]}, dp[i][j-1]: #{dp[i][j-1]}"
    raise 'foo'
  end
end

# p answer
puts answer.join('')
