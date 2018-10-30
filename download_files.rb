require 'rubygems'
require 'wayback_machine_downloader'
gem 'wayback_machine_downloader', '~> 2.2.1'

@path = `bundle show wayback_machine_downloader --paths`.chomp
@path += '/bin/wayback_machine_downloader'

file = ARGV[0]

contents = File.read(file)

contents.each_line do |url|
  puts "Dowloading files for #{url}"
  `ruby #{@path} #{url}`
end