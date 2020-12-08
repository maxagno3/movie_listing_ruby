require "flicks/playlist"
require "flicks/playlist_module"

module Flicks
  describe PlayList do
    before do
      @playlist = PlayList.new("Max")
    end

    context "change the rank based on the number dice rolls" do
      before do
        @inital_rank = 10
        @movie = Movie.new("goonies", @inital_rank)
        @playlist.add_movie(@movie)
      end

      it "gives movie a thumbs up if the number rolled if high" do
        PlaylistModule.stub(:roll_dice).and_return(5)
        @playlist.play_movie(3)
      end

      it "does not change the movie rank if the number rolled is medium" do
        PlaylistModule.stub(:roll_dice).and_return(3)
        @playlist.play_movie(3)
      end

      it "gives movie a thumbs down if the number rolled is low" do
        PlaylistModule.stub(:roll_dice).and_return(1)
        @playlist.play_movie(3)
      end
    end
  end
end
