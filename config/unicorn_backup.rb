root = "/Users/monishkumar/Projects/RailsProjects/listly"
working_directory root
pid "#{root}/tmp/pids/unicorn_backup.pid"
stderr_path "#{root}/log/unicorn_backup.err.log"
stdout_path "#{root}/log/unicorn_backup.out.log"

listen "/tmp/unicorn.listly.backup.sock"
worker_processes 4
timeout 30

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{root}/Gemfile"
end
