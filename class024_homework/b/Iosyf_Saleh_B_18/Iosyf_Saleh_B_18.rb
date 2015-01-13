require 'spec_helper'
require '/home/iluvanime/yt/lib/yt/models/video.rb'	#path to your video.rb

rating = nil

describe Yt::Video do	
	subject(:video) { Yt::Video.new attrs }
  
	describe '#snippet' do
		context 'given fetching a video returns a snippet' do
			let(:attrs) { {snippet: {"title"=>"Fullscreen Creator Platform"}} }
			it { expect(video.snippet).to be_a Yt::Snippet }
		end
	end

	describe '#liked?' do
			let(:attrs) { {id: 'video-id'} }
			it "liked?" do
			likes  = nil
			LIKES = :like
			allow(likes).to receive(:likes).and_return(:like)
			allow(video).to receive(:rating).and_return(likes)
			allow(likes).to receive(:set).and_return(LIKES)
			allow(likes).to receive(:rating).and_return(LIKES)
			expect(video.like).to be true
		end
	end
	describe '#disliked?' do
		let(:attrs) { {id: 'video-id'} }
		it "disliked?" do
			dislikes  = nil
			DISLIKES = :dislike
			allow(dislikes).to receive(:likes).and_return(:like)
			allow(video).to receive(:rating).and_return(dislikes)
			allow(dislikes).to receive(:set).and_return(DISLIKES)
			allow(dislikes).to receive(:rating).and_return(DISLIKES)
			expect(video.dislike).to be true
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
	
	describe '#rated?' do
		let(:attrs) { {id: 'video-id'} }
		context 'rated?' do
			it {
				allow(video).to receive(:rating).and_return(rating)
				allow(rating).to receive(:rating).and_return(:like)
				expect(video.liked?).to be true
			}
		end
	end
	
end
