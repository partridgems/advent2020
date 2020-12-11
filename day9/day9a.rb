Range = 25
list = []

STDIN.read.each_line do |line|
  list << line.to_i
end

# Does any pair of members of preamble (sorted) add up to item?
def preamble_makes?(preamble, item)
  preamble.each_with_index do |elem1, index|
    preamble[index + 1, preamble.length - index - 1].each do |elem2|
      return true if elem1 + elem2 == item
    end
  end
  return false
end

def is_valid?(index, list)
  preamble = list[index - Range, Range].sort
  return preamble_makes?(preamble, list[index])
end

list.each_with_index do |item, index|
  next if index < Range
  if !is_valid?(index, list)
    puts item
    exit
  end
end

