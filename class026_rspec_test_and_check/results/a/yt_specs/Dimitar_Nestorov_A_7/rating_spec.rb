require 'spec_helper'
require 'yt/models/rating'

describe Yt::Rating do
  subject(:rating) { Yt::Rating.new }

  describe '#update' do
    before { expect(rating).to receive(:do_update).and_yield }

    it { expect{rating.set :like}.to change{rating.rating} }
  end
  

 describe '#like' do 
	 allow(rating).to receive(:like).and_return(:like)
	 allow(rating).to receive(:dislike).and_return(:dislike)
	 allow(rating).to receive(:none).and_return(:none)
 end


end
