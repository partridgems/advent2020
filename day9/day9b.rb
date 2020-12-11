RangeLen = 25


# Does any pair of members of preamble (sorted) add up to item?
def preamble_makes?(preamble, item)
  preamble.each_with_index do |elem1, index|
    preamble[index + 1, preamble.length - index - 1].each do |elem2|
      return true if elem1 + elem2 == item
    end
  end
  return false
end

def array_sum(array)
  array.inject(0) {|sum,x| sum + x }
end

def is_valid?(index, list)
  preamble = list[index - RangeLen, RangeLen].sort
  return preamble_makes?(preamble, list[index])
end

def find_exploit(weakness, list)
  list.each_with_index do |entry, index|
    # Does an exploit exist starting here?
    exploit_list = [entry]
    inner = index + 1
    if array_sum(exploit_list) == weakness
      puts "ERROR: weakness is exactly the value at index " + index.to_s
      exit
    end
    while inner < list.length do
      exploit_list << list[inner]
      if array_sum(exploit_list) == weakness
        return exploit_list
      end
      inner += 1
    end
  end  
  puts "ERROR: found no exploit."
  return [-1]
end

def main()
  list = []
  STDIN.read.each_line do |line|
    list << line.to_i
  end

  puts "Finished reading input."
  puts "Finsing weakness..."

  weakness = -1
  list.each_with_index do |item, index|
    next if index < RangeLen
    if !is_valid?(index, list)
      weakness = item
    end
  end

  puts "Found weakness: " + weakness.to_s
  puts "Finding exploit..."

  exploit_list = find_exploit(weakness, list).sort
  min = exploit_list[0]
  max = exploit_list[-1]

  puts "Exploit range: " + min.to_s + " " + max.to_s
  puts "Exploit sum: " + (min + max).to_s
end

main()
