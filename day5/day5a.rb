max_id = 0

STDIN.read.each_line do |line|
  new_id = (line[0..6].gsub("F","0").gsub("B","1").to_i(base=2) * 8) + line[7..9].gsub("R","1").gsub("L","0").to_i(base=2)
  max_id = max_id < new_id ? new_id : max_id
end

puts max_id
