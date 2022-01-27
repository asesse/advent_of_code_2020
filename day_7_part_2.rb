class IndividualBags

  def initialize
    @inputs = File.open('files/day_7').read.split("\n")
  end

  def run
    count = 0
    shiny_bag = find_bag('shiny gold') # renvoie la hash couleur / quantité
    shiny_bag.each do |color, quantity| 
      count += quantity.to_i * content(color) 
    end
    puts count
  end

  private

  def find_bag(color)
    bag = @inputs.detect { |input| input.match?(/#{color} bags contain/) }
    bag_content = bag.split('contain ').last
    parse_bag_content(bag_content)
 
  end

  def parse_bag_content(content
    return {} if content == "no other bags."
    content.split(/bags[.,]|bag[.,]/).map(&:strip)
           .map { |e| e.split(/(\d) /)[1..].reverse }.to_h
  end

  def content(color)
    count = 1
    parsed_bag_content = find_bag(color)
    parsed_bag_content.each do |inside_bag_color, quantity|
      count += quantity.to_i * content(inside_bag_color)
    end
    return count
  end
end

IndividualBags.new.run