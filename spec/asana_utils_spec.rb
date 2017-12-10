require 'minitest/autorun'
require 'asana_utils'

describe 'AsanaUtile' do
  before { ENV['asana_token'] = '0/575a63469f9f126097f3996e0c0c5f38' }

  let :task_id { '112233445556' }

  it "should get task by id" do
    task = Papua::AsanaUtils.find_task(task_id)
    task[:id].must_equal task_id
  end

  it 'should throw if token not set' do
    ENV['asana_token'] = nil

    -> { Papua::AsanaUtils.find_task(task_id) }.must_raise RuntimeError
  end

  it "should move task to specified state" do
    skip 'not implemented'
  end

  it "should throw exception if transition not allowed" do
    skip 'not implemented'
  end
end
