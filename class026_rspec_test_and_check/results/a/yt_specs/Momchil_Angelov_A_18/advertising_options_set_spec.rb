require 'spec_helper'
require 'yt/models/advertising_options_set'

describe Yt::AdvertisingOptionsSet do
	subject(:data) { Yt::AdvertisingOptionsSet.new data: data }
	
	describe '#initialize' do
		context 'initializing' do
			let(:data) { {@video_id: {"ABC4545" => "ACC444"}} }
			
    		it { expect(advertising_options_set.@video_id).to be "ACC444"}
		end
	end

	describe '#patch_params' do
  		context 'patching parameters' do
  			let(:data) { {"path"=>"/youtube/partner/v1/videoAdvertisingOptions/#{@video_id}"} }  	
  				
  			it { expect(advertising_options_set.send(:patch_params)).to be Hash }
  		end
  	end
end
