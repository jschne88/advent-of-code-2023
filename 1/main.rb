file = File.open(ARGV[0])
lines = file.readlines.map { |line| line }

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
        left_pointer += 1
      end
    end

    if right_digit.nil?
      if /\d/.match?(line[right_pointer]) && right_digit.nil?
        right_digit = line[right_pointer].to_i
      else
        right_pointer -= 1
      end
    end
  end
  sum + "#{left_digit}#{right_digit}".to_i
end

puts total
