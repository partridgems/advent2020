table = {}
file_handle = File.open("input", "r")
file_handle.each_line do |line|
  num = line.to_i
  if table[num]
    puts((2020 - num) * num)
  end
  table[2020 - num] = num
end

