require 'spec_helper'
require 'yt/models/resource'

describe Yt::Resource do
  subject(:resource) { Yt::Resource.new attrs }

  context 'given a resource initialized with a URL (containing an ID)' do
    let(:attrs) { {url: 'youtu.be/MESycYJytkU'} }

    it { expect(resource.id).to eq 'MESycYJytkU' }
    it { expect(resource.kind).to eq 'video' }
    it { expect(resource.username).to be_nil }
  end

  context 'given a resource initialized with a URL (containing a username)' do
    let(:attrs) { {url: 'youtube.com/fullscreen'} }

    it { expect(resource.kind).to eq 'channel' }
    it { expect(resource.username).to eq 'fullscreen' }
  end
end

describe Yt::Resource do
  subject(:resource) { Yt::Resource.new }

  describe '#update' do
    it { expect(resource.update).to rescue NoMethodError }
  end

  describe '#update_params' do
    expected = {:path=>"/youtube/v3/resources", :auth=>nil, :host=>"www.googleapis.com", :expected_response=>Net::HTTPOK, :method=>:put, :request_format=>:json}
    it { expect(resource.send(:update_params)).to eq expected }
  end

  describe '#delete_params' do
    expected =  {:path=>"/youtube/v3/resources", :auth=>nil, :host=>"www.googleapis.com", :expected_response=>Net::HTTPNoContent, :method=>:delete, :params=>{:id=>nil}}
    it { expect(resource.send(:delete_params)).to eq expected }
  end


end