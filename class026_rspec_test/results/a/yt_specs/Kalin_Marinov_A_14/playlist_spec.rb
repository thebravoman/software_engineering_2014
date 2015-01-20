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

	describe '#delete_playlist_items' do
		let(:attrs) { {id: 'PLSWYkYzOr'} }
		it do
			allow_any_instance_of(Yt::Models::Playlist).to receive(:delete_playlist_items).and_return true
			expect(playlist.delete_playlist_items).to be_truthy
		end
	end

	describe '#delete' do
		let(:attrs) { {id: 'PLSWYkYzOr'} }
		it do
			allow_any_instance_of(Yt::Models::Playlist).to receive(:do_delete).and_return true
			expect(playlist.delete).to be_falsey
		end
	end

	describe '#exists?' do
		let(:attrs) { {id: 'PLSWYkYzOr'} }
		it { expect(playlist.exists?).to be_truthy }
	end

	describe '#add_videos' do
		let(:attrs) { {id: 'PLSWYkYzOr'} }
		it do
			mock = double('something')
			allow(mock).to receive(:map).and_return true
			expect(playlist.add_videos(mock)).to be_truthy
		end
	end

	describe '#add_videos!' do
		let(:attrs) { {id: 'PLSWYkYzOr'} }
		it do
			mock = double('something')
			allow(mock).to receive(:map).and_return true
			expect(playlist.add_videos!(mock)).to be_truthy
		end
	end
end
