require 'byebug'

class EncounteredTreesCount

  def initialize
    @lines = File.open('files/day_3_input').read.split("\n")
  end

  def tobbogan_path
    trees = 0
    index = 0
    @lines.each do |line|
      position = (index % line.length)
      trees += 1 if line[position] == '#'
      index += 3
    end
    puts trees
  end
end

EncounteredTreesCount.new.tobbogan_path
