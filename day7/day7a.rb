bag_map = {}

def find_gold(bag, bag_map)
  if bag_map[bag] == "GOLD"
    return "GOLD"
  elsif bag_map[bag] == nil
    return "no other"
  else
    bag_map[bag].each do |child|
      val = find_gold(child, bag_map)
      if val == "GOLD"
        bag_map[bag] = "GOLD"
        return "GOLD"
      end
    end
    bag_map[bag] = nil
    return nil
  end
end

# Process the input and build the initial bag map. Bags map to either nil (no
# children), "GOLD" (children contain a shiny gold bag), or a list of child
# bags by name.
STDIN.read.each_line do |bag|
  parts = bag.split(" bags contain ")
  parent_bag = parts[0]
  if parts[1] == "no other bags.\n"
    bag_map[parent_bag] = nil
    next
  elsif parts[1].include?("shiny gold") || parent_bag == "shiny gold"
    bag_map[parent_bag] = "GOLD"
  else 
    child_bags = []
    child = ""
    parts[1].split(" ").each do |child_piece|
      if child_piece[0,3] == "bag"  # End of this bag
        child_bags << child
        child = ""
      elsif /[0-9]/.match(child_piece)  # Bag count. Ignore.
        next
      else  # Part of a child bag name. Concat (possibly plus a space)
        child = child == "" ? child_piece : child + " " + child_piece
      end
    end  # End of parsing a child list
    bag_map[parent_bag] = child_bags
  end  # End of "this is a child list"
end

# Done reading input. Now use memoization to find all paths with "GOLD" in them.
total_gold = -1  # Don't count "shiny gold itself"
bag_map.each_key do |bag|
  if find_gold(bag, bag_map) == "GOLD"
    total_gold += 1
  end
end

puts(total_gold)
