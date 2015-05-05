require 'spec_helper'
require 'yt/models/resumable_session'

describe Yt::ResumableSession do
  before :each do
    @mocked_uri = double("@uri")
    allow(URI).to receive(:parse).and_return(@mocked_uri)
    @session = Yt::ResumableSession.new
  end

  describe '#upload_video' do
    it do
      allow(@session).to receive(:do_update).and_return(Yt::Video.new)
      expect(@session.upload_video("file")).to be_an(Yt::Video)
    end
  end

  describe '#session_params' do
    it do
      mocked_parse = double("parse")
      allow(@mocked_uri).to receive(:query)
      allow(CGI).to receive(:parse).and_return({'id1'=>['1', '2'], 'id2'=>['3', '4']})
      expect(@session.send(:session_params)).to eq({'id1'=>'1', 'id2'=>'3'})
    end
  end

  describe '#update_params' do
    it 'should return expected' do
      allow(@mocked_uri).to receive(:host).and_return("host")
      allow(@mocked_uri).to receive(:path).and_return("path")
      allow(@session).to receive(:session_params).and_return("params")
      expected = {
        :auth => nil,
        :request_format => :file,
        :host => "host",
        :path => "path",
        :expected_response => Net::HTTPSuccess,
        :method => :put,
        :headers => nil,
        :camelize_params => false,
        :params => "params"
      }
      expect(@session.send(:update_params)).to eq(expected)
    end
  end
end
