valid_count = 0
STDIN.read.split("\n").each do |line|
  parts = line.split(" ")
  first_idx = parts[0].split("-")[0].to_i - 1
  second_idx = parts[0].split("-")[1].to_i - 1
  char = parts[1][0]
  count = 0
  if (parts[2].split("")[first_idx] == char) ^ (parts[2].split("")[second_idx] == char)
    valid_count += 1
  end
end
puts(valid_count)

