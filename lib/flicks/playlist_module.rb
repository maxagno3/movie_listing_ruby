module PlaylistModule
  def self.roll_dice
    rand(1..6)
  end

  def self.review(movie)
    number_rolled = roll_dice
    case number_rolled
    when 1..2
      movie.thumbs_down
      puts "#{movie.name} got a thumbs down."
    when 3..4
      puts "#{movie.name}'s rank did not change."
    else
      movie.thumbs_up
      puts "#{movie.name} got a thumbs up!"
    end
  end
end
