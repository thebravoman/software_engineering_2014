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
    @auth_test = double("@auth")
    attributes_test = {
      :auth => @auth_test
    }
    @asset_test = Yt::Asset.new attributes_test
  end

  describe '#update' do   
    it 'updates data' do
      expect(@asset_test).to receive(:underscore_keys!)
      expect(@asset_test).to receive(:do_patch)
      expect(@asset_test.update).to be true
    end
  end

  describe '#patch_params' do
    it 'patches expected_response, path, params, host, method and auth' do
      allow(@auth_test).to receive(:owner_name).and_return("test")
      expected = {
        :expected_response => Net::HTTPOK,
        :path =>  "/youtube/partner/v1/assets/",
        :params => {on_behalf_of_content_owner: @auth_test.owner_name},
        :host => "www.googleapis.com",
        :method => :patch,
        :auth => @auth_test
      }
      expect(@asset_test.send(:patch_params)).to eq(expected)
    end
  end
end