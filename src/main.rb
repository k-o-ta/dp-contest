VALUE_TOTAL=(10**5)
MAX_WEIGHT = 10**11
# VALUE_TOTAL=14
# MAX_WEIGHT = 12
n, w_total = gets.chomp.split(' ').map(&:to_i)
table = []
(0..n).each do |i|
  # p "1#{table}"
  if i == 0
    # table.push(Array.new(VALUE_TOTAL+1, 0))
    table.push([0].concat(Array.new(VALUE_TOTAL, MAX_WEIGHT)))
    next 
  end

  # if i == 1
  #   w, v = gets.chomp.split(' ').map(&:to_i)
  #   # p w
  #   # p v
  #   # before = Array.new(v, 0)
  #   # after = Array.new(VALUE_TOTAL-v+1, w)
  #   # table.push(before.concat(after))
  # table.push(Array.new(VALUE_TOTAL+1, MAX_WEIGHT))
  #   next 
  # end

  table.push(Array.new(VALUE_TOTAL+1, MAX_WEIGHT))
  # p "2#{table}"

  w, v = gets.chomp.split(' ').map(&:to_i)
  (0..VALUE_TOTAL).each do |value|
    # ナップザックに入れられる場合
    # p "i: #{i}, value: #{value}, v: #{v}"
    if v <= value
    # p "i: #{i}, value: #{value}, v: #{v}, #{table[i][1000001]}"
      if table[i-1][value - v] + w < table[i][value]
        # p 'foo'
#         if i == n
# p table[i-1][value - v] + w
#         end
        table[i][value] = table[i-1][value - v] + w
      end
    end
    # p "i: #{i}, value: #{value} #{table}"

    if table[i-1][value] < table[i][value]
        # p 'bar'
      table[i][value] = table[i-1][value]
    end
  end
end

# p table
weights =  table[n].filter{|w| w <= w_total}
ans = 0
table[n].each_with_index do |value, i|
  if value <= w_total
    ans = i
  end
end
puts ans
# p table[n].uniq
# p table.size
# puts weights
# p table[n].index(8)
# puts table[n].index(weights[0])
# puts table[n].index(weights[1])
# puts table[n].index(weights[2])
# puts table[n].index(weights[3])
# puts table[n].index(weights[4])
# puts table[n].index(weights[5])
# puts weights.max_by { |w| table[n].rindex(w) }
# puts weights.map { |i| table[n].rindex(i) }.max
