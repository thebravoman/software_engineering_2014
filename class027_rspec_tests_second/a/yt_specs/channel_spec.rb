# require 'spec_helper'
require 'yt/models/channel'
require 'yt/models/content_owner'
require 'yt/errors/unauthorized'

describe Yt::Channel do
  subject(:channel) { Yt::Channel.new attrs }

  describe '#snippet' do
    context 'given fetching a channel returns a snippet' do
      let(:attrs) { {snippet: {"title"=>"Fullscreen"}} }
      it { expect(channel.snippet).to be_a Yt::Snippet }
    end
  end

  describe '#status' do
    context 'given fetching a channel returns a status' do
      let(:attrs) { {status: {"privacyStatus"=>"public"}} }
      it { expect(channel.status).to be_a Yt::Status }
    end
  end

  describe "#report_channel" do 
    context 'report channel with unknown owner' do
      let(:attrs) { {auth: (Yt::ContentOwner.new owner_name: 'Random'), id: '123'} }
      it {
        expect(channel.reports_params).to eq({:ids=>"contentOwner==Random", :filters=>"channel==123"})
      }
    end
  end

  describe "#if_subscribed" do 
    context 'check if user was subscribed' do
      account = Yt::Account.new access_token: 'ya29.1.ABCDEFGHIJ'
      let(:attrs) { {auth: account, id: 'UCxO1tY8h1AhOz0T4ENwmpow'} }
      
      # let(:attrs) { { id: 'id' } }
      
      # error = { Yt::Errors::Unauthorized }
      # let(:attrs) { { auth: (Yt::Account.new access_token: 'ya29.1.ABCDEFGHIJ') } } #id: 'UCxO1tY8h1AhOz0T4ENwmpow') } } #, access_token: 'ya29.1.ABCDEFGHIJ' } }
      
      # it { expect(channel.subscribed?).to raise_error(Errors::NoItems) }

      it {
        subscription = double('subscription')
        allow(channel).to receive(:subscription).and_return(subscription)
        allow(subscription).to receive(:exists?).and_return(true)
        expect(channel.subscribed?).to be true
      }

    end
  end

  describe '#10_seconds_passed' do
    context 'if 10 seconds have passed' do 
      let(:attrs) { {url: 'youtu.be/P1QUZzeZoPQ'} }
      currentTime = Time.new(2015, 01, 01, 0, 0, 0, "+02:00")
      it { 
        allow(Time).to receive(:now).and_return(currentTime)
        expect(channel.throttle_subscriptions(0)).to eq(currentTime)
      }
    end
  end

  # describe '#report_params_second_if' do
  #   context ''
  # end

end