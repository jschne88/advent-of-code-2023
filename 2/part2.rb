file = File.open(ARGV[0])
lines = file.readlines(chomp: true).map { |line| line }

total = lines.reduce(0) do |sum, line|
  game_list = line.split(": ")[1]

  color_mins = {
    red: 0,
    blue: 0,
    green: 0
  }

  game_list.split(";").each do |set|
    set.split(", ").each do |pull|
      amount, color = pull.split(" ")
      amount = amount.to_i
      color = color.to_sym
      if amount > color_mins[color]
        color_mins[color] = amount
      end
    end
  end

  sum + color_mins[:red] * color_mins[:blue] * color_mins[:green]
end

puts total
