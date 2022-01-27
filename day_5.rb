require 'byebug'

class GetSeatId
  attr_reader :seats
  
  def initialize
    @seats = File.open('files/day_5').read.split("\n")
  end

  def get_seat_id
    seats_id = []
    seats.each { |seat| seats_id << get_row(seat[0..6]) * 8 + get_column(seat[7..9]) } 
    return seats_id.max  
  end

  def find_my_seat
    seats_id = []
    seats.each { |seat| seats_id << get_row(seat[0..6]) * 8 + get_column(seat[7..9]) } 
    seats_id.sort!
            .each_with_index do |seat_id, index|
              if (seats_id[index + 1] - seats_id[index]) != 1
                puts seats_id[index] + 1
                return
              end
            end
  end

  private

  def get_row(row_letter_code)
    row = (0..127).to_a
    row_letter_code.each_char do |letter|
      row_f = row[0..(row.length / 2 - 1)]
      row_b = row[(row.length / 2)..-1]
      row = row_f if letter == 'F' 
      row = row_b if letter == 'B'
    end
    return row[0]
  end

  def get_column(column_letter_code)
    column = (0..7).to_a
    column_letter_code.each_char do |letter|
      column_l = column[0..(column.length / 2 - 1)]
      column_r = column[(column.length / 2)..-1]
      column = column_l if letter == 'L' 
      column = column_r if letter == 'R'
    end
    return column[0]
  end
end

puts GetSeatId.new.find_my_seat