require_relative "movie"
require_relative "playlist_module"
require_relative "snack_bar"

module Flicks
  class PlayList
    def initialize(name)
      @name = name
      @movie_name = []
    end

    def load(other_file)
      File.readlines(other_file).each do |line|
        add_movie(Movie.from_csv(line))
      end
    end

    def save(to_file = "movie_rankings.csv")
      File.open(to_file, "w") do |file|
        @movie_name.sort.each do |movie|
          file.puts movie.to_csv
        end
      end
    end

    def add_movie(name_of_movie)
      @movie_name << name_of_movie
    end

    def play_movie(viewings)
      puts @movie_name.sort

      snacks = SnackBar::SNACKS

      puts "We have total of #{snacks.length} snacks available for you to choose from."

      puts "#{@name}'s playlist:"

      1.upto(viewings) do |viewing_count|
        puts "\n Viewings: #{viewing_count}"
        @movie_name.each do |movie|
          PlaylistModule.review(movie)

          snacks = SnackBar.random

          movie.ate_snack(snacks)

          puts "#{movie.name}."
        end
      end
    end

    def total_carbs_consumed
      @movie_name.reduce(0) do |sum, movie|
        sum + movie.carbs_consumed
      end
    end

    def print_stats
      puts "\nTotal Carbs: #{total_carbs_consumed}"

      @movie_name.each do |movie|
        movie.each_snack do |snack|
          puts "#{snack.carbs} total #{snack.name} carbs"
        end
        puts "You consumed total #{movie.carbs_consumed} carbs while watching the movie."
      end

      hits, flops = @movie_name.partition { |movie| movie.hit }
      puts "Hit movies:"
      puts hits.sort
      puts "Flop movies:"
      puts flops.sort
    end
  end
end
