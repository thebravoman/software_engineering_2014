require 'spec_helper'
require 'yt/models/resumable_session'

describe Yt::ResumableSession do
  before :each do
    @mocked_uri = double("@uri")
    allow(URI).to receive(:parse).and_return(@mocked_uri)
    @session = Yt::ResumableSession.new
  end


  describe '#session_params' do
    it 'is expecting hash' do
      mocked_parse = double("parse")
      allow(@mocked_uri).to receive(:query)
      allow(CGI).to receive(:parse).and_return({'id1'=>['1', '2'], 'id2'=>['3', '4']})
      expect(@session.send(:session_params)).to eq({'id1'=>'1', 'id2'=>'3'})
    end
  end

end
