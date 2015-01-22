require 'spec_helper'
require 'yt/models/account'

describe Yt::Account do
	before :each do
		@account = Yt::Account.new
	end

	describe '#upload_video' do
		it do
			mocked_file = double("file")
			mocked_resumable_sessions = double("resumable_sessions")
			mocked_session = double("session")
			allow(@account).to receive(:open).with('url', 'rb').and_return(mocked_file)
			allow(@account).to receive(:resumable_sessions).and_return(mocked_resumable_sessions)
			allow(mocked_file).to receive(:size).and_return('size')
			allow(mocked_resumable_sessions).to receive(:insert).with('size', 'good').and_return(mocked_session)
			allow(mocked_session).to receive(:upload_video).with(mocked_file).and_return('success!')
			expect(@account.upload_video('url', 'good')).to eq('success!')
		end
	end

	describe '#create_playlist' do
		it do
			mocked_playlists = double("playlists")
			allow(@account).to receive(:playlists).and_return(mocked_playlists)
			allow(mocked_playlists).to receive(:insert).with('params').and_return('success!')
			expect(@account.create_playlist('params')).to eq('success!')		
		end
	end

	describe 'video_params' do
		it do
			expect(@account.videos_params).to eq({for_mine: true})
		end
	end
end
