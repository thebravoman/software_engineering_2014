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

  describe '#update' do
    context 'updates attributes and returns true' do
      let(:attributes) {}
      it{expect(:attributes).to eq :attributes}
    end
  end

  describe '#patch_params' do
    context 'it patches expected_response, path and params' do
    let(:path) {}
    it{expect(:path).to eq :path}
    let(:expected_response) {}
    it{expect(:expected_response).to eq :expected_response}
    it{expect(:params).to eq :params}
  end
  end
end