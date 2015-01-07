require_relative "spec_helper.rb"
require_relative "video.rb"

describe Yt::Video do
  subject(:video) { Yt::Video.new attrs }

  describe '#content_details' do
    context 'given fetching a video returns content details' do
      let(:attrs) { {content_details: {"definition"=>"hd"}} }
      it { expect(video.content_detail).to be_a Yt::ContentDetail }
    end
  end
  
  describe '#tags' do
	context 'given tags' do
		it {expect(video.snippet).to be 10}
	end
  end
  
  describe '#exists?' do
	context 'is it really nil?' do
		it {expect(video.id).to be nil}
	end
  end
  
  describe '#reports_params' do
	context 'if acc not partnered ret. appropriate hash' do
      let(:attrs) { {auth: (Yt::Account.new auth: 'Name'), id: 'test123'} }
      expected_result = { ids: "channel==test123" }
     it { expect(channel.reports_params).to eq expected_result }
    end
    context 'if acc partnered ret. appropriate hash' do
      let(:attrs) { {auth: (Yt::ContentOwner.new owner_name: 'Name'), id: 'need_test123'} }
      expected_result = { ids: "contentOwner==Name", filters: "channel==need_test123" }
      it { expect(channel.reports_params).to eq expected_result }
    end
  end
  
  describe '#delete' do
    let(:attrs) { {id: 'video-id'} }

    context 'given an existing video' do
      before { expect(video).to receive(:do_delete).and_yield }

      it { expect(video.delete).to be true }
      it { expect{video.delete}.to change{video.exists?} }
    end
  end
  
  describe '#snippet' do
    context 'given fetching a video returns a snippet' do
      let(:attrs) { {snippet: {"title"=>"Fullscreen Creator Platform"}} }
      it { expect(video.snippet).to be_a Yt::Snippet }
    end
  end

  describe '#update' do
    let(:attrs) { {id: 'MESycYJytkU', snippet: {'title'=>'old'}} }
    before { expect(video).to receive(:do_update).and_yield 'snippet'=>{'title'=>'new'} }

    it { expect(video.update title: 'new').to be true }
    it { expect{video.update title: 'new'}.to change{video.title} }
  end
  
  describe '#statistics_set' do
    context 'given fetching a video returns statistics' do
      let(:attrs) { {statistics: {"viewCount"=>"202"}} }
      it { expect(video.statistics_set).to be_a Yt::StatisticsSet }
    end
  end
end
