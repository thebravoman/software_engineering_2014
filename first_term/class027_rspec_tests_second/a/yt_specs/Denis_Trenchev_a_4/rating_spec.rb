require 'spec_helper'
require 'yt/models/rating'

describe Yt::Rating do
  subject(:rating) { Yt::Rating.new }

  describe '#update' do
    before { expect(rating).to receive(:do_update).and_yield }

    it { expect{rating.set :like}.to change{rating.rating} }
  end
  
  describe '#update_params' do
  	it 'updates parameters' do
  		rating_val = double("rating")
  		allow(rating).to receive(:rating).and_return(rating_val)
  		allow(rating_val).to receive(:rating).and_return(Hash)
  		expect(rating.send(:update_params)).to include :method
  	end
  end
end
