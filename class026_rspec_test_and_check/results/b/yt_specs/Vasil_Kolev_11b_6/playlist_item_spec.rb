require_relative './playlist_item.rb'

describe "#Yt" do
	describe "#Models" do
		before :each do
			@playlist_item = PlaylistItem.new "channel_id",
 			"channel_title", "playlist_id", "position",
			"video_id", "video", "snippet"
		end
		it "#Makes a PlaylistItem with 7 arguments" do
			@playlist_item = PlaylistItem.new "channel_id",
 			"channel_title", "playlist_id", "position",
			"video_id", "video", "snippet"
		end
		it "#Checks if class PlaylistItem exists" do
			@playlist_item.exists? == true
		end
		it "#Deletes the class playlistItem" do
			@playlist_item.delete
			@playlist_id == nil
		end
	end
end
