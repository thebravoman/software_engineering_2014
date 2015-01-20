require 'spec_helper'
require 'yt/models/account'
require 'yt/models/video'
require 'yt/models/playlist'
	
describe Yt::Account do
subject(:account) { Yt::Account.new }
	
	 describe '#upload_video' do
	 	context 'given a valid account returns a video' do
			it do
		 		session = double('mocked session')
				resumable_sessions = double('mocked resumeable_sessions')
				allow(account).to receive(:open).and_return('open covered')
				allow(account).to receive(:resumable_sessions).and_return(resumable_sessions)
				allow(resumable_sessions).to receive(:insert).and_return(session)
				allow(session).to receive(:upload_video).and_return(Yt::Video.new)
				expect(account.upload_video('test_path', {})).to be_instance_of(Yt::Video)
			 end
	 	end
	 end
	
	 describe '#create_playlist' do
		 context 'given a valid account returns a playlist' do
			 it do
				 playlists = double('mocked playlists')
				 allow(account).to receive(:playlists).and_return(playlists)
				 allow(playlists).to receive(:insert).and_return(Yt::Playlist.new)
				 expect(account.create_playlist({})).to be_instance_of(Yt::Playlist)
			end
		end
	end
end
