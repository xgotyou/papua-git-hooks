module Papua
  class AsanaUtils
    def self.find_task(id)
      raise "Env variable asana_token should be set" unless ENV['asana_token']
      { id: id }
    end
  end
end
