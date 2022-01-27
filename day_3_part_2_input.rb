require 'byebug'

class EncounteredTreesCount

  def initialize
    @lines = File.open('files/day_3_input').read.split("\n")
  end

  def tobbogan_path(right, down)
    trees = 0
    index = 0
    @lines.each_with_index do |line, i|
      next if i.odd? && down == 2
      position = (index % line.length)
      trees += 1 if line[position] == '#'
      index += right
    end
    puts trees
  end
end

# if down is > 1 remove the line that is line[index + 1]


sloth_1 = EncounteredTreesCount.new.tobbogan_path(1, 1)
sloth_2 = EncounteredTreesCount.new.tobbogan_path(3, 1)
sloth_3 = EncounteredTreesCount.new.tobbogan_path(5, 1)
sloth_4 = EncounteredTreesCount.new.tobbogan_path(7, 1)
sloth_5 = EncounteredTreesCount.new.tobbogan_path(1, 2)

result = (sloth_1 * sloth_2 * sloth_3 * sloth_4 * sloth_5)
puts result