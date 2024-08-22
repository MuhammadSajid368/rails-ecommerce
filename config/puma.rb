# config/puma.rb

# Number of threads to use
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

# Set the port that Puma will listen on
port ENV.fetch("PORT") { 3000 }

# Use `bind` instead of `port` for more flexibility
bind "tcp://0.0.0.0:3000"

# Set the environment to production
environment ENV.fetch("RAILS_ENV") { "production" }

# Log and PID file paths
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
state_path ENV.fetch("STATE_PATH") { "tmp/pids/puma.state" }
stdout_redirect ENV.fetch("STDOUT_LOG") { "log/puma.stdout.log" }, ENV.fetch("STDERR_LOG") { "log/puma.stderr.log" }, true
