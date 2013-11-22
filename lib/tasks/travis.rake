
# http://about.travis-ci.org/docs/user/gui-and-headless-browsers/#RSpec%2C-Jasmine%2C-Cucumber
task :travis do
  ["rspec spec", "rake cucumber"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
end
