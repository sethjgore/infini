SSH_USER = 'facundoe'
SSH_HOST = 'ftp.facundoelement.com'
SSH_DIR  = '/version2/'

desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end
desc "Run the preview server at http://localhost:4444"
task :seesee do
  system("middleman server")
end

desc "Deploy website via rsync"
task :curtains do
  puts "## Deploying website via rsync to #{SSH_HOST}"
  status = system("rsync -avze 'ssh' --delete build/ #{SSH_USER}@#{SSH_HOST}:#{SSH_DIR}")
  puts status ? "OK" : "FAILED"
end

desc "Build and deploy website"
task :showtime => [:build, :curtains] do
end