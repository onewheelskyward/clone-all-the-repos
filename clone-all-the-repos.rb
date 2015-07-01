require 'json'
require 'github_api'

# all_the_repos = JSON.parse( IO.read(ARGV[0]) )

repos    = Github::Client::Repos.new auto_pagination: true
response = repos.list user: 'mixpo'

response.each do |repo|
  puts "got #{repo.name}"
  if File.exists? repo.name
    next
  else
    system "git clone git@github.com:mixpo/#{repo.name}"
  end
end
