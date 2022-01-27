require 'byebug'

class SumOfYesAnswers
  attr_reader :answers
  def initialize
    @answers = File.open('files/day_6').read.split("\n")
    group_answers
    unique_answers
  end

  def count_answers
    answers.map! { |answer| answer.length}.reduce(:+)
  end

  private

  def group_answers
    current_index = 0
    while current_index < answers.length - 1
      if !answers[current_index + 1].empty?
        answers[current_index] += (answers[current_index + 1])
        answers.delete_at(current_index + 1)
      else
        answers.delete_at(current_index + 1)
        current_index += 1
      end
    end
  end

  def unique_answers
    answers.map! { |answer| answer.split(//)}.map! { |answer| answer.uniq}
  end
end

puts SumOfYesAnswers.new.count_answers