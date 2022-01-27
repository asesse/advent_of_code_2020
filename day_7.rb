require 'byebug'

class CountBags
  attr_reader :bag
  def initialize
    @inputs = File.open('files/day_7').read.split("\n")
    @bag = 'shiny gold'
    @bag_list = []
  end
  # store each bag that contains 'shiny gold' in an array => yellow and white
  # then for those bags we call the method find_container_bag =>for white : red, orange, for yellow: red, orange BUT don't store if color is already in array
  # store in the array the new bags and remove 
  def solve
    bags = find_container_bags(@bag)
    find_all_bags(bags)
    @bag_list.count
  end
 
  def find_all_bags(bags)
    
    new_bags = bags - @bag_list
    @bag_list = @bag_list.union(bags)
    return if new_bags.empty?
    new_bags.each do |new_bag|
      find_all_bags(find_container_bags(new_bag))
    end
  end

  def find_container_bags(bag)
    @inputs.filter { |input| input.match?(/\d #{bag} (bag|bags)/) }
           .map { |input| input.match(/(?<bag>\w+ \w+) bags contain/)[:bag] } #unless @bag_list.include?(input.match(/(?<bag>\w+ \w+) bags contain/)[:bag]) 
  end

end

puts CountBags.new.solve