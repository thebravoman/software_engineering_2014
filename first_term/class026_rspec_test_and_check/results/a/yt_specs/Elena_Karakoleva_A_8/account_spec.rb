require 'spec_helper'
require 'yt/models/account'

describe Yt::Account do
	subject(:account) { Yt::Account.new }
	describe '#create_playlist' do
		context 'playlist creation' do
			it do
				it { expect(account.create_playlist('name')).to be_instance_of(Yt::Playlist) rescue NoMthodError }
			end
		end
	end

end
