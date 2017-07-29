workers Integer(ENV.fetch("WEB_CONCURRENCY", 2))
threads_count = Integer(ENV.fetch("MAX_THREADS", 2))
threads(threads_count, threads_count)

if ENV.fetch("RAILS_ENV") { "development" } == "production"
  bind "unix:///home/amree/prihatin/current/tmp/sockets/puma-prihatin.sock"
  directory "/home/amree/prihatin/current/"
  pidfile "/home/amree/prihatin/current/tmp/pids/puma-prihatin.pid"
  state_path "/home/amree/prihatin/current/tmp/puma-prihatin.state"
  stdout_redirect "/home/amree/prihatin/current/log/puma.log", "/home/amree/prihatin/current/log/puma.log"
end

plugin :tmp_restart
