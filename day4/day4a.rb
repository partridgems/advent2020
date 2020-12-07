required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
valid_count = 0

STDIN.read.split("\n\n").each do |passport|
  current_passport = {}
  passport.split.each do |entry|
    current_passport[entry.split(":")[0]] = 1
  end
  has_all_fields = true
  required_fields.each do |field|
    if !current_passport.key?(field)
      has_all_fields = false
    end
  end
  if has_all_fields
    valid_count += 1
  end
end

puts valid_count
