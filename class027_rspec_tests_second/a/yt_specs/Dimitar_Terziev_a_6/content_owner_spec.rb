require 'spec_helper'

describe Yt::ContentOwner do
subject(:own) { Yt::ContentOwner.new }
	context 'init' do
		it do
			expect(own {onwe_name:'pesho'})
		end
		it do
			expect(own.create_reference)
		end
	end
end
