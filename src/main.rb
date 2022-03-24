n, w_total = gets.chomp.split(' ').map(&:to_i)
table = []
(0..n).each do |i|
  table.push(Array.new(w_total+1, 0))
  next if i == 0

  w, v = gets.chomp.split(' ').map(&:to_i)
  (0..w_total).each do |w_limit|
    # ナップザックに入れられる場合
    if w <= w_limit
      if table[i-1][w_limit - w] + v > table[i][w_limit]
        table[i][w_limit] = table[i-1][w_limit - w] + v
      end
    end

    # ナップザックに入れられない場合
    # 上のelse節にするとこのパターンがskipされてしまう
    if table[i-1][w_limit] > table[i][w_limit]
      table[i][w_limit] = table[i-1][w_limit]
    end
  end
end

# p table
puts table.max_by {|row| row.max }.max
