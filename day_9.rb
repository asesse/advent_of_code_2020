require 'byebug'

class EncodingError
  def initialize
    @numbers = File.open('files/day_9').read.split("\n").map(&:to_i)
  end

  def solve
    # return the first element qui evalue to false
    max_index = @numbers.length - 1
    (25..max_index).each do |index|
      return @numbers[index] if !is_valid?(index)
    end
  end

  def encryption_weakness
    set = find_contiguous_set
    puts set.min + set.max
  end

  def find_contiguous_set
    @numbers.each_with_index do |number, index|
      contiguous_set =  check_contiguous(index)
      return contiguous_set if contiguous_set
    end
  end

  def check_contiguous(index)
    contiguous_set = []
    invalid_number = solve
    current_index = index
    while current_index <= @numbers.length  
      remaining = invalid_number - @numbers[current_index]
      contiguous_set << @numbers[current_index] 
      return false if remaining < 0 

      if remaining == @numbers[current_index +1]   
        contiguous_set << @numbers[current_index +1]
        return contiguous_set
      else
        invalid_number = remaining
        current_index += 1
      end 
    end
    return false
  end

  def is_valid?(index)
    current_index = 0
    preamble_numbers = preamble_array(index)
    while current_index <= preamble_numbers.length - 1
      remaining = @numbers[index] - preamble_numbers[current_index]
      return true if preamble_numbers.include?(remaining)
      current_index += 1
    end
  end

  def preamble_array(index)
    start = index - 25
    ending = index - 1
    preamble_array = @numbers[start..ending]
  end
end

puts EncodingError.new.encryption_weakness