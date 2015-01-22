require 'spec_helper'

describe Yt::Configuration do
  subject(:config) { Yt::Configuration.new }

  describe '#client_id' do
    context 'without an environment variable YT_CLIENT_ID' do
      before { ENV['YT_CLIENT_ID'] = nil }
      it {expect(config.client_id).to be_nil }
    end

    context 'given an environment variable YT_CLIENT_ID' do
      let(:client_id) { '1234567890.apps.googleusercontent.com' }
      before { ENV['YT_CLIENT_ID'] = client_id}
      it {expect(config.client_id).to eq client_id }
    end
  end

  describe '#client_secret' do
    context 'without an environment variable YT_CLIENT_SECRET' do
      before { ENV['YT_CLIENT_SECRET'] = nil }
      it {expect(config.client_secret).to be_nil }
    end

    context 'given an environment variable YT_CLIENT_SECRET' do
      let(:client_secret) { '1234567890' }
      before { ENV['YT_CLIENT_SECRET'] = client_secret}
      it {expect(config.client_secret).to eq client_secret }
    end
  end

  describe '#api_key' do
    context 'without an environment variable YT_API_KEY' do
      before { ENV['YT_API_KEY'] = nil }
      it {expect(config.api_key).to be_nil }
    end

    context 'given an environment variable YT_API_KEY' do
      let(:api_key) { '123456789012345678901234567890' }
      before { ENV['YT_API_KEY'] = api_key}
      it {expect(config.api_key).to eq api_key }
    end
  end

	describe '#developing?' do
      it do
			mocked_log_level = double('log_level')
			mock2 = double('log_level.to_s')
 			allow(ENV).to receive(:[]).and_return(mocked_log_level)
			allow(mocked_log_level).to receive(:to_s).and_return(mock2)
			allow(mock2).to receive(:in?).with(%w(devel)).and_return("tested")
			expect(config.developing?).to eq("tested")
		end
  end

  describe '#debugging?' do
		it do
			mocked_log_level = double('log_level')
			mock2 = double('log_level.to_s')
 			allow(ENV).to receive(:[]).and_return(mocked_log_level)
			allow(mocked_log_level).to receive(:to_s).and_return(mock2)
			allow(mock2).to receive(:in?).with(%w(devel debug)).and_return("tested")
			expect(config.debugging?).to eq("tested")
		end
  end
end
