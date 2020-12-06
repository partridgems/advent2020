width = -1
sloper = [1, 3, 5, 7, 1]
sloped = [1, 1, 1, 1, 2]
hill = []

STDIN.read.split("\n").each do |line|
  hill << line
  if width == -1
    width = line.length
  end
end

output = 1

sloper.each_with_index do |right, down_i|
  down = sloped[down_i]
  xpos = 0
  ypos = down
  tree_count = 0
  hill.each do |row|
    if ypos == down
      ypos = 0
      if row.split('')[xpos] == '#'
        tree_count += 1
      end
      xpos = (xpos + right) % width
    end
    ypos += 1
  end
  output *= tree_count
end

puts(output)

