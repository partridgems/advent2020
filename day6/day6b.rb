
total = 0

STDIN.read.split("\n\n").each do |group|
  yes_questions = {}
  group_size = group.split("\n").length
  group.each_char do |char|
    if char == "\n"
      next
    elsif yes_questions.key?(char)
      yes_questions[char] += 1
    else
      yes_questions[char] = 1
    end
  end
  yes_questions.each do |_, count|
    if count == group_size
      total += 1
    end
  end
end

puts total
