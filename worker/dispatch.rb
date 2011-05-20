require "./thumbnail"

class Dispatch
  def self.run(job)
    if job['operation'] == "thumbnail"
      Thumbnail.new job
    else
      puts "Unknown Operation %s" % job['operation']
    end
  end
end



