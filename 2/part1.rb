require "pry"
require "pry-byebug"

file = File.open(ARGV[0])
lines = file.readlines(chomp: true).map { |line| line }

bag_contents = {
  red: 12,
  green: 13,
  blue: 14
}

total = lines.reduce(0) do |sum, line|
  game, game_list = line.split(": ")
  game_id = game.split(" ")[1]

  is_possible = true

  game_list.split(";").each do |set|
    set.split(", ").each do |pull|
      amount, color = pull.split(" ")
      if bag_contents[color.to_sym] < amount.to_i
        is_possible = false
      end
    end
  end

  is_possible ? sum + game_id.to_i : sum
end

puts total
