def execute(pc, acc, code_seg)
  case code_seg[pc][0]
  when "nop"
    pc += 1
  when "acc"
    acc += code_seg[pc][1]
    pc += 1
  when "jmp"
    pc += code_seg[pc][1]
  else
    puts "Unknown opcode at " + pc.to_s + ": " + code_seg[pc]
  end
  return pc, acc
end

code_seg = []

STDIN.read.each_line do |line|
  s = line.split
  code_seg << [s[0], s[1].to_i]
end

pc = 0
acc = 0
executed = {}
while true
  break if executed.key?(pc)
  executed[pc] = true
  (pc, acc) = execute(pc, acc, code_seg)
end

puts acc
