require 'net/http'
require 'uri'
require 'fileutils'

class FeederImport

  def self.cache!(file, key)
    filename = File.basename(file)
    source_file = File.expand_path(file)
    dest_file = File.expand_path(File.join(ENV['IMPORT_CACHE'], key, filename))

    dest_dir = File.dirname(dest_file)
    FileUtils.mkdir_p(dest_dir) unless File.exist?(dest_dir)

    FileUtils.safe_unlink(dest_file) if File.exist?(dest_file)
    FileUtils.cp(source_file, dest_file)
  end

  def self.notify!(file, feed, timestamp = nil)
    timestamp ||= Time.now

    uri = URI("#{ENV['FEEDER_IMPORT_URL']}/api/v1/import")
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json', 'token' => ENV['FEEDER_API_TOKEN'])
    req.body = {
      feed: feed,
      url: "#{ENV['FEEDER_FLINGER_URL']}/#{feed}/#{File.basename(file)}",
      timestamp: timestamp
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    res.code == 200
  end
end