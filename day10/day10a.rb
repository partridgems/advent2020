adapters = []

STDIN.each_line do |line|
  adapters << line.to_i
end

adapters = adapters.sort

diffs = { 1 => 0, 2 => 0, 3 => 0 }
input = 0
adapters.each do |output|
  diff = output - input
  diffs[diff] += 1
  input = output
end

diffs[adapters[-1] + 3 - input] += 1

puts diffs.to_s

puts diffs[1] * diffs[3]
