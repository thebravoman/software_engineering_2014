require 'spec_helper'
require 'yt/models/ownership'
require 'simplecov'

describe Ownership_test do
	it "#tries to make Ownership class"
		classtest1 = Ownership.new
		classtest1.data = "data"
		classtest1.auth = "auth"
		classtest1.asset_id = "id"
	end

