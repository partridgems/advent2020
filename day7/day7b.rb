bag_child_map = {}
bag_size = {}

def count_children(bag, bag_child_map, bag_size)
  puts("Counting " + bag)
  if bag_size.key?(bag)
    return bag_size[bag]
  else
    child_sum = 1  # Self
    bag_child_map[bag].each do |child|
      child_sum += count_children(child, bag_child_map, bag_size)
    end
    bag_size[bag] = child_sum
    return child_sum
  end
end

# Process the input and build the initial bag maps.
STDIN.read.each_line do |bag|
  parts = bag.split(" bags contain ")
  parent_bag = parts[0]
  if parts[1] == "no other bags.\n"
    bag_size[parent_bag] = 1
  else 
    child_bags = []
    child = ""
    child_multiplier = 0
    parts[1].split(" ").each do |child_piece|
      if child_piece[0,3] == "bag"  # End of this bag
        child_multiplier.times { child_bags << child }
        child = ""
      elsif /[0-9]/.match(child_piece)  # Multiplier.
        child_multiplier = child_piece.to_i
      else  # Part of a child bag name. Concat (possibly plus a space)
        child = child == "" ? child_piece : child + " " + child_piece
      end
    end  # End of parsing a child list
    bag_child_map[parent_bag] = child_bags
  end  # End of "this is a child list"
end

# Done reading input. Now use memoization to compress all paths.
# Remember not to count the bag itself.
puts(count_children("shiny gold", bag_child_map, bag_size) - 1)
