root = "/Users/monishkumar/Projects/RailsProjects/listly"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.err.log"
stdout_path "#{root}/log/unicorn.out.log"

listen "/tmp/unicorn.listly.sock"
worker_processes 4
timeout 30

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{root}/Gemfile"
end
