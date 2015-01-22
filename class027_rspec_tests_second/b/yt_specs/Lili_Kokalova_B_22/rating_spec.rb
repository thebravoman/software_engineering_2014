require 'spec_helper'
require 'yt/models/rating'

describe Yt::Rating do
  subject(:rating) { Yt::Rating.new }

  describe '#update' do
    before { expect(rating).to receive(:do_update).and_yield }

    it { expect{rating.set :like}.to change{rating.rating} }
  end

	before :each do
		@myrating = Yt::Rating.new
	end

	describe '#set' do
		it 'rating to receive do_update with fixed params' do
			expect(@myrating).to receive(:do_update).with(params: {rating: 'n1'})
			@myrating.set('n1')
		end
	end

	describe '#update_params' do
		it 'should eq expected' do
			expected = {
				:method => :post,
				:path => '/youtube/v3/videos/rate',
				:params => {id: nil},
				:auth => nil,
 				:expected_response => Net::HTTPNoContent,
				:host => "www.googleapis.com"
			}
			expect(@myrating.send(:update_params)).to eq(expected)
		end
	end
end
