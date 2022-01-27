require 'byebug'

entries = File.open('files/day_1_input').read.split("\n").map(&:to_i)


entries.each_with_index do |entry1, index|
  entries[(index + 1)...entries.length].each do |entry2|
  puts entry1 * entry2 if (entry1 + entry2) == 2020
  end
end



