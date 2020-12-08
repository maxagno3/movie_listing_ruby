require_relative "rankable"

module Flicks
  class Movie
    include Rankable

    attr_accessor :name
    attr_accessor :rank

    def initialize(name, rank = 0)
      @name = name.capitalize
      @rank = rank.to_i
      @snacks_carbs = Hash.new(0)
    end

    def to_csv
      "#{@name},#{@rank}"
    end

    def self.from_csv(line)
      title, rank = line.split(",")
      Movie.new(title, Integer(rank))
    end

    def each_snack
      @snacks_carbs.each do |name, carbs|
        snack = Snacks.new(name, carbs)
        yield snack
      end
    end

    def ate_snack(snack)
      @snacks_carbs[snack.name] += snack.carbs
      puts "I consumed #{snack.name} which had #{snack.carbs} carbs while watching the movie"
    end

    def carbs_consumed
      @snacks_carbs.values.reduce(0, :+)
    end

    def to_s
      puts "#{@name} is a really cool movie and has a rank of #{normalized_rank}."
    end
  end

  # __FILE__ stores the current filename whereas $0 stores the program/file that is currently running
  if __FILE__ == $0
    movie1 = Movie.new("goosebumps", 50)
    puts movie1.name
    puts movie1.rank
  end
end
