require 'byebug'

entries = File.open('files/day_1_input').read.split("\n").map(&:to_i)
=begin
entries.each_with_index do |entry, index|
  next if index == (entries.length - 1)
  result = entry + entries[index + 1]
  next if result >= 2020
  result_2 = 2020 - result
  final_result = entry * entries[index + 1] * result_2 if entries.include?(result_2)
  puts final_result
end
=end


entries.each_with_index do |entry1, index|
  entries[(index + 1)...(entries.length - 1)].each do |entry2|
  result = entry1 + entry2
  next if result >= 2020
  result_2 = 2020 - result
  puts(entry1 * entry2 * result_2) if entries.include?(result_2)
  end
end
