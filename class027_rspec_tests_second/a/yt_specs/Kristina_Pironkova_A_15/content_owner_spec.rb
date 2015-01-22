require 'spec_helper'
require 'yt/models/content_owner'

describe Yt::ContentOwner do
  subject(:content_owner) { Yt::ContentOwner.new }

  describe '#create_reference' do
  	it do
      references=double('mocked_reference')
      allow(content_owner).to receive(:references).and_return(references)
      allow(references).to receive(:insert).and_return(:params)
  		expect(content_owner.create_reference).to eq(:params)
  	end
  end

  describe '#create_asset' do
    it do
      assets=double('mocked_assets')
      allow(content_owner).to receive(:assets).and_return(assets)
      allow(assets).to receive(:insert).and_return(:params)
      expect(content_owner.create_asset).to eq(:params)
    end
  end


  describe '#create_claim' do
    it do
      claims=double('mocked_claims')
      allow(content_owner).to receive(:claims).and_return(claims)
      allow(claims).to receive(:insert).and_return(:params)
      expect(content_owner.create_claim).to eq(:params)
    end
  end
end