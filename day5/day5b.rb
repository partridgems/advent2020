seats = []

STDIN.read.each_line do |line|
  seats << (line[0..6].gsub("F","0").gsub("B","1").to_i(base=2) * 8) + line[7..9].gsub("R","1").gsub("L","0").to_i(base=2)
end

seats = seats.sort

seats.each_with_index do |seat_id, index|
  if index+1 < seats.length && seats[index + 1] != seat_id + 1
    puts(seat_id + 1)
  end
end

