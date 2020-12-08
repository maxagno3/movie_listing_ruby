require "flicks/movie"

module Flicks
  describe Movie do
    before do
      @initial_rank = 10
      @movie = Movie.new("goonies", @initial_rank)
    end

    it "has a capitalized name" do
      @movie = Movie.new("goonies")
      @movie.name.should == "Goonies"
    end

    it "has a rank of 10" do
      @movie.rank.should == 10
    end

    it "increases the count of rank when thumbs up" do
      @movie.thumbs_up
      @movie.rank.should == @initial_rank + 1
    end

    it "decreases the count of rank when thumbs down" do
      @movie.thumbs_down
      @movie.rank.should == @initial_rank - 1
    end

    context "created with a default rank" do
      before do
        @movie = Movie.new("goonies")
      end

      it "should have a rank of 0" do
        @movie.rank.should == 0
      end
    end

    context "has a rank of atleast 10" do
      before do
        @movie = Movie.new("goonies", 10)
      end

      it "movie is a hit" do
        @movie.hit.should == true
      end

      it "has a status of hit" do
        @movie.status.should == "Hit"
      end
    end

    context "has a rank less than 10" do
      before do
        @movie = Movie.new("goonies", 9)
      end

      it "movie is a flop" do
        @movie.hit.should == false
      end

      it "has a statud of flop" do
        @movie.status.should == "Flop"
      end
    end
  end
end
