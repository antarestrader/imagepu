require "rubygems"
require "RMagick"

class Thumbnail
  def initialize(job)
    puts "Start %s" % job['source']
    if File.exists? job['source']
      img = Magick::Image.read(job['source'])
      thumb = img.first.scale(64,64)
      thumb.write(job['destination'])
      puts "Complete %s" % job['destination']
    end
  end
end

