# frozen_string_literal: true

redis_url = ENV.fetch("REDIS_URL", "redis://localhost:6379/0")
id = "Ruby-PID-#{::Process.pid}"

REDIS = ConnectionPool::Wrapper.new { Redis.new(url: redis_url, id: id) } unless Rails.env.test?
