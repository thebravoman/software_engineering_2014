require 'spec_helper'
require 'yt/models/ownership'


describe Yt::Ownership do

  subject(:ownership) { Yt::Ownership.new data: data }
  let(:data) { {} }

  describe '#obtain' do
    context 'Assigns 100% of the general ownership' do
      let(:auth) { {snippet: {"new"=>"old"}} }
      it { expect(ownership.owner_name).to be_a 100 }
    end
  end

  describe '#release' do
    context 'Releases 100% of the general ownership' do
      let(:auth) { {snippet: {"new"=>"old"}} }
      it { expect(ownership.owner_name).to be_a 0 }
    end
  end

end
