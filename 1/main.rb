file = File.open(ARGV[0])
lines = file.readlines(chomp: true).map { |line| line }

def num_word = {
  one: "1",
  two: "2",
  three: "3",
  four: "4",
  five: "5",
  six: "6",
  seven: "7",
  eight: "8",
  nine: "9",
  ten: "10"
}

total = lines.reduce(0) do |sum, line|
  left_pointer = 0
  right_pointer = line.length - 1
  left_digit = nil
  right_digit = nil

  while left_digit.nil? || right_digit.nil?
    if left_digit.nil?
      if /\d/.match?(line[left_pointer])
        left_digit = line[left_pointer].to_i
      else
        num_word.keys.each do |key|
          if line[left_pointer..].match?(/^#{key}/)
            left_digit = num_word[key]
            break
          end
        end
        left_pointer += 1
      end
    end

    if right_digit.nil?
      if /\d/.match?(line[right_pointer])
        right_digit = line[right_pointer].to_i
      else
        num_word.keys.each do |key|
          if line[..right_pointer].match?(/#{key}$/)
            right_digit = num_word[key]
            break
          end
        end
        right_pointer -= 1
      end
    end
  end
  sum + "#{left_digit}#{right_digit}".to_i
end

puts total
