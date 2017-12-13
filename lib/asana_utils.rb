require 'asana'

module Papua
  class AsanaUtils
    def self.find_task(id)
      raise "Env variable asana_token should be set" unless ENV['asana_token']
      { id: id }
    end

    def self.open_task(id)
      client = Asana::Client.new do |c|
        c.authentication :access_token, '0/575a63469f9f126097f3996e0c0c5f38'
      end

      begin
        task = client.tasks.find_by_id(id)
      rescue
        puts "Unable to find task with id (#{feature_name}). Please check. Feature name should be Asana task id."
        exit 1
      end
    end
  end
end
