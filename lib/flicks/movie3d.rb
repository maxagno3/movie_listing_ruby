require_relative "movie"

module Flicks
  class Movie3D < Flicks::Movie
    def initialize(name, rank, wow_factor)
      super(name, rank)
      @wow_factor = wow_factor
    end

    def thumbs_up
      @wow_factor.times { super }
    end

    def show_effect
      puts "Wow! " * @wow_factor
    end
  end
end

movie3d = Flicks::Movie3D.new("glee", 5, 10)
puts movie3d.name
puts movie3d.rank
puts movie3d.thumbs_up
puts movie3d.show_effect
