require 'json'

all_the_repos = JSON.parse( IO.read(ARGV[0]) )

all_the_repos.each_with_index do |repo, index|
  puts "#{index.to_f / all_the_repos.count.to_f * 100}%"
  system "git clone git@github.com:#{repo['full_name']}"
end
