pairs = {}
list = []
file_handle = File.open("input", "r")
file_handle.each_line do |line|
  num = line.to_i
  if pairs[num]
    puts(pairs[num] * num)
    exit
  end
  list.each do |item|
    pairs[2020 - num - item] = num * item
  end
  list << num
end

