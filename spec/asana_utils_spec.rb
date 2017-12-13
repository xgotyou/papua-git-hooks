require 'minitest/autorun'
require 'asana'
require 'asana_utils'

describe 'AsanaUtile' do
  before { ENV['asana_token'] = token }

  let :token { '0/575a63469f9f1' }
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
    asana_client = Minitest::Mock.new
    asana_client.expect :authentication, nil, [:access_token, token]
    asana_client.expect :tasks, tasks = Minitest::Mock.new
    tasks.expect :find_by_id, {}, [task_id]

    Asana::Client.stub :new, asana_client do
      Papua::AsanaUtils.open_task(task_id)
    end

    assert_mock asana_client
  end

end
