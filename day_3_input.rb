require 'byebug'

class EncounteredTreesCount

  def initialize
    @lines = File.open('files/day_3_input').read.split("\n")
  end

  def tobbogan_path
    trees = 0
    index = 0
    lines.each do |line|
      extend_string_length(line, index)
      trees += 1 if line[index] == '#'
      index += 3
    end
    puts trees
  end

  private

  attr_reader :lines

  def extend_string_length(line, index)
    while index >= line.length do
      line.insert(-1, line)
    end
  end
end

EncounteredTreesCount.new.tobbogan_path