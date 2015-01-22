require 'spec_helper'
require 'yt/models/account'

describe Yt::Account do
	subject(:account) { Yt::Account.new }

	describe 'videos_params' do
		it { expect(account.videos_params).to eq({for_mine: true}) }
	end

	describe '#create_playlist' do 
		it do
			expect(account.playlists).to receive(:insert).with("some value")
			account.create_playlist "some value"	
		end
	end

	describe '#upload_video' do
		it do
			session = double
			allow(account).to receive(:open).with("test_path", "rb").and_return 4
			allow(account.resumable_sessions).to receive(:insert).and_return session
			expect(session).to receive(:upload_video)
			account.upload_video "test_path"
		end	
	end
end
