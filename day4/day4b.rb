def str_between(val, lo, hi)
  num = val.to_i
  return (num <= hi) && (num >= lo)
end

required_fields = {
    "byr" => ->(val) { str_between(val, 1920, 2002) },
    "iyr" => ->(val) { str_between(val, 2010, 2020) }, 
    "eyr" => ->(val) { str_between(val, 2020, 2030) },
    "hgt" => ->(val) { if val[-2..-1] == "in"
                         str_between(val[0..-3], 59, 76)
                       elsif val[-2..-1] == "cm"
                         str_between(val[0..-3], 150, 193)
                       else
                         false
                       end},
    "hcl" => ->(val) { /^#[0-9a-f]{6}$/.match(val) },
    "ecl" => ->(val) { /^(amb|blu|brn|gry|grn|hzl|oth)$/.match(val) },
    "pid" => ->(val) { /^[[:digit:]]{9}$/ }}

def validate_passport(passport, required_fields)
  current_passport = {}
  passport.split.each do |entry|
    (key, value) = entry.split(":")
    if required_fields.key?(key) && required_fields[key].(value) && !current_passport.key?(key)
      puts("Accepting key: " + entry)
      current_passport[key] = 1
    end
  end
  required_fields.each do |key, _|
    if !current_passport.key?(key)
      return false
    end
  end
  return true
end

valid_count = 0
STDIN.read.split("\n\n").each do |passport|
  if validate_passport(passport, required_fields)
    valid_count += 1
  end
end

puts valid_count
