require 'spec_helper'
require 'yt/models/resumable_session'
require 'yt/models/video'

describe Yt::ResumableSession do
        describe '#upload_video' do
                it 'returns an instance on Yt::Video' do
                        resumable_session = Yt::ResumableSession.new
                        allow(resumable_session).to receive(:do_update).and_return({})
                        expect(resumable_session.upload_video()).to eq(Yt::Video.new)
                end
        end

        describe '#session_params' do
                it 'returns an expected hash' do
                        resumable_session = Yt::ResumableSession.new
                        mocked_parse = double("parse")
                        exp_hash = {'id1' => 'test1'}
                        allow(CGI).to receive(:parse).and_return(mocked_parse)
                        allow(mocked_parse).to receive(:tap).and_return(exp_hash)
                        expect(resumable_session.send(:session_params)).to eq(exp_hash)
                end
        end
end
