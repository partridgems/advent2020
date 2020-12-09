def execute_step(pc, acc, code_seg)
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

def test_loop(code_seg)
  pc = 0
  acc = 0
  executed = {}
  while pc < code_seg.length && !executed.key?(pc)
    executed[pc] = true
    (pc, acc) = execute_step(pc, acc, code_seg)
  end
  return pc < code_seg.length ? nil : acc
end

def swap_instr(instr)
  return "nop" if instr == "jmp"
  return "jmp" if instr == "nop"
end

code_seg.length.times do |i|
  # If this instruction is a jmp/nop, try flipping it and checking for a loop.
  if code_seg[i][0] == "jmp" || code_seg[i][0] == "nop"
    code_seg[i][0] = swap_instr(code_seg[i][0])
    val = test_loop(code_seg)
    if val != nil
      puts "Answer: " + val.to_s
      exit
    else
      code_seg[i][0] = swap_instr(code_seg[i][0])
    end
  end
end

puts "\nError. All tested paths had loops."
