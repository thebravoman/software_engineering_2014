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
		it 'rating should receive do_update with parameters' do
			expect(@myrating).to receive(:do_update).with(params: {rating: 'a5'})
			@myrating.set('a5')
		end
	end

	describe '#update_params' do
		it 'should update parameters' do
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
