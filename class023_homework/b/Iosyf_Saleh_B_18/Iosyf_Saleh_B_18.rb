 describe Video do
	vid = Video.new
	context '#success?' do
		it {expect(video.id).to be != nil}
	end

	describe '#delete' do
		
	end
	
	describe '#tags' do
		context 'has/is being given tags?' do
			it {expect(video.snippet.tags).to be > 0}
		end
	end

	describe '#content_details' do
		context 'given fetching a video returns content details' do
		  let(:attrs) { {content_details: {"definition"=>"hd"}} }
		  it { expect(video.content_detail).to be_a Yt::ContentDetail }
		end
	end
end
