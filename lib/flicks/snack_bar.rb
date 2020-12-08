Snacks = Struct.new(:name, :carbs)

module SnackBar
  SNACKS = [
    Snacks.new(:popcorn, 20),
    Snacks.new(:tacos, 10),
    Snacks.new(:candy, 30),
    Snacks.new(:nachos, 15),
    Snacks.new(:kebabs, 25),
  ]

  def self.random
    SNACKS.sample
  end
end

if __FILE__ == $0
  SnackBar::SNACKS
  snacks = SnackBar.random
  puts "I consumed #{snacks.name} which had #{snacks.carbs} carbs"
end
