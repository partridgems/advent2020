width = -1
sloper = 3
sloped = 1
tree_count = 0
xpos = 0

STDIN.read.split("\n").each do |line|
  if width == -1
    width = line.length
  end
  if line.split('')[xpos] == '#'
    tree_count += 1
  end
  xpos = (xpos + sloper) % width
end

puts(tree_count)

