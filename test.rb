require 'minitest/autorun'
require 'lib/asana_utils'

describe 'test' do
  it "should be true" do
    AsanaUtils.truthy.must_equal true
  end
end
