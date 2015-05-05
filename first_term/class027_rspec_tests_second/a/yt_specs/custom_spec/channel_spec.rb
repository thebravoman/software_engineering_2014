# require 'yt/models/channel'

# describe Yt::Channel do
#   subject(:channel) { Yt::Channel.new attrs }
#   channel = Yt::Channel.new attrs
#   describe "#throttle_subscriptions" do
#     context '10 seconds passed' do
#       let(:attrs) { {status: {"privacyStatus"=>"public"}} }
#       currentTime = Time.new(2015,01,01, 0, 0, 0, "+02:00")
#       it {
#         allow(Time).to receive(:now).and_return(currentTime)
#         # result = channel.throttle_subscriptions 10
#       }
#       expect(channel.throttle_subscriptions(0)).to eq(currentTime)
#     end
#   end 
# end