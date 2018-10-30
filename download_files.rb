require 'rubygems'
require 'wayback_machine_downloader'
gem 'wayback_machine_downloader', '~> 2.2.1'

class DownloadFiles
  def initialize(path = './sites.txt')
    @file = path
    @path = `bundle show wayback_machine_downloader --paths`.chomp
    @path += '/bin/wayback_machine_downloader'
  end

  def download_sites
    contents = File.read(@file)

    contents.each_line do |url|
      puts "Dowloading files for #{url}"
      `ruby #{@path} #{url}`
    end
  end
end

a = DownloadFiles.new(ARGV[0])
a.download_sites
