require 'byebug'

class PasswordCheck
  def initialize
    @entries = File.open('files/day_2_input').read.split("\n")
  end
  
  def solve_part_1
    puts entries.map! { |entry| split_entry(entry) }
                .select { |entry| validate_inclusion?(entry) }
                .count
  end

  def solve_part_2
    puts entries.map! { |entry| split_entry_2(entry) }
                .select { |entry| validate_presence?(entry) }
                .count
  end

  private

  attr_reader :entries

  def split_entry(entry)
    result = /(\d+)-(\d+) (.): (\w+)/.match(entry)
    if result
      entry = {
        occurence_required: (result[1].to_i..result[2].to_i),
        letter: result[3],
        password: result[4]
      }
    end
  end

  def split_entry_2(entry)
    result = /(\d+)-(\d+) (.): (\w+)/.match(entry)
    if result
      entry = {
        first_index: result[1].to_i,
        last_index: result[2].to_i,
        letter: result[3],
        password: result[4]
      }
    end
  end

  def validate_inclusion?(entry)
    occurence_of_letter = entry[:password].count(entry[:letter])
    entry[:occurence_required].include?(occurence_of_letter)
  end

  def validate_presence?(entry)
    (entry[:password][entry[:first_index] - 1]  == entry[:letter]) ^ (entry[:password][entry[:last_index] - 1] == entry[:letter])
  end
end

PasswordCheck.new.solve_part_1
PasswordCheck.new.solve_part_2