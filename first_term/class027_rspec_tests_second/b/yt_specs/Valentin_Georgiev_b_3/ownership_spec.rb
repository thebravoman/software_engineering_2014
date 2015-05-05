require 'spec_helper'
require 'yt/models/ownership'

describe Yt::Ownership do
  subject(:ownership) { Yt::Ownership.new data: data }
  let(:data) { {} }

  describe '#general_owners' do
    context 'given fetching an ownership returns a general owner' do
      let(:general) { '{"ratio":100.0,"owner":"FullScreen","type":"exclude"}' }
      let(:data) { {"general"=>[general]} }
      it { expect(ownership.general_owners.size).to be 1 }
      it { expect(ownership.general_owners.first).to be_a Yt::RightOwner }
    end

    context 'given fetching an ownership does not return general owners' do
      it { expect(ownership.general_owners).to be_empty }
    end
  end

  describe '#performance_owners' do
    context 'given fetching an ownership returns a performance owner' do
      let(:performance) { '{"ratio":100.0,"owner":"FullScreen","type":"exclude"}' }
      let(:data) { {"performance"=>[performance]} }
      it { expect(ownership.performance_owners.size).to be 1 }
      it { expect(ownership.performance_owners.first).to be_a Yt::RightOwner }
    end

    context 'given fetching an ownership does not return performance owners' do
      it { expect(ownership.performance_owners).to be_empty }
    end
  end

  describe '#synchronization_owners' do
    context 'given fetching an ownership returns a synchronization owner' do
      let(:synchronization) { '{"ratio":100.0,"owner":"FullScreen","type":"exclude"}' }
      let(:data) { {"synchronization"=>[synchronization]} }
      it { expect(ownership.synchronization_owners.size).to be 1 }
      it { expect(ownership.synchronization_owners.first).to be_a Yt::RightOwner }
    end

    context 'given fetching an ownership does not return synchronization owners' do
      it { expect(ownership.synchronization_owners).to be_empty }
    end
  end

  describe '#mechanical_owners' do
    context 'given fetching an ownership returns a mechanical owner' do
      let(:mechanical) { '{"ratio":100.0,"owner":"FullScreen","type":"exclude"}' }
      let(:data) { {"mechanical"=>[mechanical]} }
      it { expect(ownership.mechanical_owners.size).to be 1 }
      it { expect(ownership.mechanical_owners.first).to be_a Yt::RightOwner }
    end

    context 'given fetching an ownership does not return mechanical owners' do
      it { expect(ownership.mechanical_owners).to be_empty }
    end
  end

	before :each do
		@mocked_auth = double("@auth")
		attrs = {
			:auth => @mocked_auth,
		}
		@myownership = Yt::Ownership.new attrs
	end

	describe '#update' do
		it do
			expect(@myownership).to receive(:underscore_keys!)
			expect(@myownership).to receive(:do_update)
			expect(@myownership.update).to be true
		end
	end

	describe '#update_params' do
		it 'should eq expected' do
			allow(@mocked_auth).to receive(:owner_name).and_return("test")
			expected = {
				:expected_response => Net::HTTPOK,
				:host => "www.googleapis.com",
				:method => :put,
				:path => "/youtube/partner/v1/assets/#{@asset_id}/ownership",
				:params => {on_behalf_of_content_owner: @mocked_auth.owner_name},
				:auth => @mocked_auth
			}
			expect(@myownership.send(:update_params)).to eq(expected)
		end
	end
end
