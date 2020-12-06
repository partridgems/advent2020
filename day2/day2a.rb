valid_count = 0
STDIN.read.split("\n").each do |line|
  parts = line.split(" ")
  min = parts[0].split("-")[0].to_i
  max = parts[0].split("-")[1].to_i
  char = parts[1][0]
  count = 0
  parts[2].each_char do |letter|
    if letter == char
      count += 1
    end
  end
  if count <= max && count >= min
    valid_count += 1
  end
end
puts(valid_count)

