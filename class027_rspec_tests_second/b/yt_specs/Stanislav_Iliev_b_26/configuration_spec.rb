require 'spec_helper'

describe Yt::Configuration do
	subject(:config) { Yt::Configuration.new }

	describe '#client_id' do
		context 'without YT_CLIENT_ID' do
			before { ENV['YT_CLIENT_ID'] = nil }
			it {expect(config.client_id).to be_nil }
		end

		context 'with YT_CLIENT_ID' do
			let(:client_id) { '1234567890.apps.googleusercontent.com' }
			before { ENV['YT_CLIENT_ID'] = client_id}
			it {expect(config.client_id).to eq client_id }
		end
	end

	describe '#client_secret' do
		context 'without YT_CLIENT_SECRET' do
			before { ENV['YT_CLIENT_SECRET'] = nil }
			it {expect(config.client_secret).to be_nil }
		end

		context 'with YT_CLIENT_SECRET' do
			let(:client_secret) { '1234567890' }
			before { ENV['YT_CLIENT_SECRET'] = client_secret}
			it {expect(config.client_secret).to eq client_secret }
		end
	end

	describe '#api_key' do
		context 'without YT_API_KEY' do
			before { ENV['YT_API_KEY'] = nil }
			it {expect(config.api_key).to be_nil }
		end

		context 'with YT_API_KEY' do
			let(:api_key) { '123456789012345678901234567890' }
			before { ENV['YT_API_KEY'] = api_key}
			it {expect(config.api_key).to eq api_key }
		end

		context 'with develop mode enabled' do
			let(:log_level) { 'devel' }
			before { ENV['YT_LOG_LEVEL'] = log_level}
			it {expect(config.developing?).to be true}
		end

		context 'with debugging disabled' do
			let(:log_level) {'devel debug'}
			before { ENV['YT_LOG_LEVEL'] = log_level}
			it {expect(config.debugging?).to be false}
		end
	end
end