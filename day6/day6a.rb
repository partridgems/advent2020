
total = 0

STDIN.read.split("\n\n").each do |group|
  yes_questions = {}
  group.each_char do |char|
    if char == "\n"
      next
    else
      yes_questions[char] = 'y'
    end
  end
  total += yes_questions.keys.length
end

puts total
