require 'spec_helper'
require 'yt/models/asset'
require 'simplecov'

SimpleCov.start

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
  
  describe 'patch params' do
    it 'tests expected response' do
    	exp_response = double("params")
    	allow(exp_response).to receive(:expected_response).and_return("Some body")
    	allow(Net::HTTPOK).to receive(:get_response).and_return(exp_response)
    	expect(exp_response.expected_response).to eq("Some body");
    end
  end
  
 # describe '#update' do
  #	attributes = "nqma_class"
 	#allow(attributes).to receive(:data) { "underscore" }
 	#expect(attributes.data).to eq("underscore")
 # end
 
 describe 'patch params' do
    it 'tests path' do
    	params = double("params")
    	allow(params).to receive(:path).and_return("/youtube/partner/v1/assets/something")
    	expect(params.path).to eq("/youtube/partner/v1/assets/something");
    end
  end
  
  
end
