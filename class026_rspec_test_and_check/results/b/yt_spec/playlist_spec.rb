require 'spec_helper'
require 'yt/models/playlist'

describe Yt::Playlist do
  subject(:playlist) { Yt::Playlist.new attrs }

  describe '#exists?' do
    context 'given a playlist with an id' do
      let(:attrs) { {id: 'PLSWYkYzOr'} }
      it { expect(playlist).to exist }
    end

    context 'given a playlist without an id' do
      let(:attrs) { {} }
      it { expect(playlist).not_to exist }
    end
  end

  describe '#snippet' do
    context 'given fetching a playlist returns a snippet' do
      let(:attrs) { {snippet: {"title"=>"Fullscreen"}} }
      it { expect(playlist.snippet).to be_a Yt::Snippet }
    end
  end

  describe '#status' do
    context 'given fetching a playlist returns a status' do
      let(:attrs) { {status: {"privacyStatus"=>"public"}} }
      it { expect(playlist.status).to be_a Yt::Status }
    end
  end

  describe '#update' do
    let(:attrs) { {id: 'PLSWYkYzOr', snippet: {'title'=>'old'}, status: {"privacyStatus"=>"public"}} }
    before { expect(playlist).to receive(:do_update).and_yield 'snippet'=>{'title'=>'new'} }

    it { expect(playlist.update title: 'new').to be true }
    it { expect{playlist.update title: 'new'}.to change{playlist.title} }
  end

  describe '#delete' do
    let(:attrs) { {id: 'PLSWYkYzOr'} }

    context 'given an existing playlist' do
      before { expect(playlist).to receive(:do_delete).and_yield }

      it { expect(playlist.delete).to be true }
      it { expect{playlist.delete}.to change{playlist.exists?} }
    end
  end
  
  describe '#add video' do
    let(:attrs) { {id: 'PLSWYkYzOr', snippet: {'title'=>'old'}, status: {"privacyStatus"=>"public"}} }
    
    playlist_item_params = nil
    playlist_items = nil
    
    before(:each) do 
      playlist_item_params = double('playlist_item_params')
      playlist_items = double('playlist_items')
      
      allow(playlist).to receive(:playlist_item_params).and_return(playlist_item_params)
     allow(playlist).to receive(:playlist_items).and_return(playlist_items)  
    end
   
    it 'adds video' do
    
      allow(playlist_items).to receive(:insert).and_return(nil)
      
      expect(playlist.add_video(nil)).to be nil 
   
    end
    
    it 'adds video!' do
       allow(playlist_items).to receive(:insert).and_return(nil)
       
       expect(playlist.add_video(nil)).to be nil
    end
    
  
  end
end
