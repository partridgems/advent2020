# Process input to build a sorted list of adapters
adapters = [0] # Start with outlet (0)
STDIN.each_line do |line|
  adapters << line.to_i
end
adapters = adapters.sort
# Add our device (max + 3)
adapters << adapters[-1] + 3
adapters = adapters.reverse

# Memoize ways to adapt from each point
memo = {}

# Iterate backwards, calculating ways to adapt from each point (using memo)
memo[adapters[0]] = 1
adapters.each_with_index do |adapt, index|
  total = 0
  next if memo[adapt] != nil
  # Look up to 3 ahead to see if they are reachable
  1.upto(3) do |lookback|
    if index - lookback >= 0
      mate = adapters[index - lookback]
      if mate - adapt <= 3
        total += memo[mate]
      end
    end
  end
  memo[adapt] = total
end

# Output ways from the start
puts memo[0]
