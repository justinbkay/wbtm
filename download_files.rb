require 'rubygems'
require 'wayback_machine_downloader'
gem 'wayback_machine_downloader', '~> 2.2.1'

class DownloadFiles
  def initialize(path)
    @file = path ||= __dir__ + '/sites.txt'
    @path = `bundle show wayback_machine_downloader --paths`.chomp
    @path += '/bin/wayback_machine_downloader'
  end

  def download_sites
    contents = File.read(@file)

    contents.each_line do |url|
      puts "Dowloading files for #{url}"
      `ruby #{@path} #{url}`
    end
  rescue Errno::ENOENT
    puts "ERROR:\nNo file has been supplied, or the file is not at the path specified\nCall this script with a valid file as the first argument."
  end
end

a = DownloadFiles.new(ARGV[0])
a.download_sites
