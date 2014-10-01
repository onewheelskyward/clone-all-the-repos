require 'json'

all_the_repos = JSON.parse( IO.read(ARGV[0]) )

all_the_repos.each do |repo|
  system "git clone git@github.com:#{repo['full_name']}"
end
