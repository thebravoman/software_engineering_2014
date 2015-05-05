require 'spec_helper'
require 'yt/models/subscription'

describe Yt::Subscription do

  subject(:subscription) { Yt::Subscription.new id: id }
  let(:msg) { {response_body: {error: {errors: [{reason: reason}]}}}.to_json }
  
  describe '#exists?' do
  
    context 'given a subscription with an id' do
      let(:id) { 'CBl6OoF0BpiV' }
      it { expect(subscription).to exist }
    end
    
    context 'given a subscription without an id' do
      let(:id) { nil }
      it { expect(subscription).not_to exist }
    end
    
  end
  
  describe '#delete' do
    let(:id) { 'XUhVCoTsBaM' }
    before { expect(subscription).to behave }
    
    context 'given an existing subscription' do
      let(:behave) { receive(:do_delete).and_yield }
      it { expect(subscription.delete).to be true }
      it { expect{subscription.delete}.to change{subscription.exists?} }
    end
    
    context 'given an unknown subscription' do
      let(:reason) { 'subscriptionNotFound' }
      let(:behave) { receive(:do_delete).and_raise Yt::Error, msg }
      it { expect{subscription.delete}.to fail.with 'subscriptionNotFound' }
      it { expect{subscription.delete ignore_errors: true}.not_to fail }
    end
    
  end
end
