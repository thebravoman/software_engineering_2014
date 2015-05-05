require 'spec_helper'
require 'yt/models/rating'

describe Yt::Rating do

	subject(:rating) { Yt::Rating.new }

	describe '#update' do
		before { expect(rating).to receive(:do_update).and_yield }

		it { expect{rating.set :like}.to change{rating.rating} }
	end

	describe '#update_params' do
		expected = {:path=>"/youtube/v3/videos/rate", :auth=>nil, :host=>"www.googleapis.com", :expected_response=>Net::HTTPNoContent, :method=>:post, :params=>{:id=>nil}}
		it { expect(rating.send(:update_params)).to eq expected }
	end

end
