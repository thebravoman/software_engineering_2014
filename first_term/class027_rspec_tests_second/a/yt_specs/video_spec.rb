# require 'spec_helper'
require 'yt/models/video'
require 'yt/models/content_owner'

describe Yt::Video do
  subject(:video) { Yt::Video.new attrs }

  describe '#snippet' do
    context 'given fetching a video returns a snippet' do
      let(:attrs) { {snippet: {"title"=>"Fullscreen Creator Platform"}} }
      it { expect(video.snippet).to be_a Yt::Snippet }
    end
  end

  describe '#statistics_set' do
    context 'given fetching a video returns statistics' do
      let(:attrs) { {statistics: {"viewCount"=>"202"}} }
      it { expect(video.statistics_set).to be_a Yt::StatisticsSet }
    end
  end

  describe '#content_details' do
    context 'given fetching a video returns content details' do
      let(:attrs) { {content_details: {"definition"=>"hd"}} }
      it { expect(video.content_detail).to be_a Yt::ContentDetail }
    end
  end

  describe '#update' do
    let(:attrs) { {id: 'MESycYJytkU', snippet: {'title'=>'old'}} }
    before { expect(video).to receive(:do_update).and_yield 'snippet'=>{'title'=>'new'} }

    it { expect(video.update title: 'new').to be true }
    it { expect{video.update title: 'new'}.to change{video.title} }
  end

  describe '#delete' do
    let(:attrs) { {id: 'video-id'} }

    context 'given an existing video' do
      before { expect(video).to receive(:do_delete).and_yield }

      it { expect(video.delete).to be true }
      it { expect{video.delete}.to change{video.exists?} }

    end
  end

  describe '#liked?' do 
    account = Yt::Account.new access_token: 'ya29.1.ABCDEFGHIJ'
    let(:attrs) {{ auth: account, url: 'https://youtu.be/P1QUZzeZoPQ'} }
    it {
      rating = double("rating")
      allow(video).to receive(:rating).and_return(rating)
      allow(rating).to receive(:rating).and_return(false)
      expect(video.liked?).to be false
    }
  end 

  describe '#like' do 
    account = Yt::Account.new access_token: 'ya29.1.ABCDEFGHIJ'
    let(:attrs) {{ auth: account, url: 'https://youtu.be/P1QUZzeZoPQ'} }
    it {
      rating = double("rating")
      allow(video).to receive(:rating).and_return(rating)
      allow(rating).to receive(:set).and_return(:like)
      allow(rating).to receive(:rating).and_return(:like)
      expect(video.like).to be true
    }
  end

  describe '#dislike' do 
    account = Yt::Account.new access_token: 'ya29.1.ABCDEFGHIJ'
    let(:attrs) {{ auth: account, url: 'https://youtu.be/P1QUZzeZoPQ'} }
    it {
      rating = double("rating")
      allow(video).to receive(:rating).and_return(rating)
      allow(rating).to receive(:set).and_return(:dislike)
      allow(rating).to receive(:rating).and_return(:dislike)
      expect(video.like).to be false
    }
  end

  describe '#report_params' do 
    account = Yt::Account.new access_token: 'ya29.1.ABCDEFGHIJ'
    let(:attrs) { {auth: (Yt::ContentOwner.new owner_name: 'Random'), id: '123'} }
    it {
      expect(video.reports_params).to eq(:ids=>"contentOwner==Random", :filters=>"video==123")
    }
  end

end