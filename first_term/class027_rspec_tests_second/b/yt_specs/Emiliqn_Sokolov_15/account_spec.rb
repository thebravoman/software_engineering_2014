require 'spec_helper'
require 'yt/models/account'

describe Yt::Account do
	before :each do
		@account = Yt::Account.new
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
