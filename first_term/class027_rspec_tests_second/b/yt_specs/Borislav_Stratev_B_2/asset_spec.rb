require 'spec_helper'
require 'yt/models/asset'

describe Yt::Asset do
  subject(:asset) { Yt::Asset.new data: data }

  describe '#id' do
    context 'given fetching a asset returns an id' do
      let(:data) { {"id"=>"A123456789012345"} }
      it { expect(asset.id).to eq 'A123456789012345' }
    end
  end

  describe '#type' do
    context 'given fetching a asset returns an type' do
      let(:data) { {"type"=>"web"} }
      it { expect(asset.type).to eq 'web' }
    end
  end

	before :each do
		@mocked_auth = double("@auth")
		attrs = {
			:auth => @mocked_auth
		}
		@myasset = Yt::Asset.new attrs
	end

	describe '#update' do		
		it do
			expect(@myasset).to receive(:underscore_keys!)
			expect(@myasset).to receive(:do_patch)
			expect(@myasset.update).to be true
		end
	end

	describe '#patch_params' do
		it 'should eq expected' do
			allow(@mocked_auth).to receive(:owner_name).and_return("test")
			expected = {
				:expected_response => Net::HTTPOK,
				:path =>  "/youtube/partner/v1/assets/",
				:params => {on_behalf_of_content_owner: @mocked_auth.owner_name},
				:host => "www.googleapis.com",
				:method => :patch,
				:auth => @mocked_auth
			}
			expect(@myasset.send(:patch_params)).to eq(expected)
		end
	end
end
