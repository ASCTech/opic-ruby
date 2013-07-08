require "opic/version"
require "pry"

module Opic
  ENDPOINT = "https://opic.osu.edu/"

  def self.get(name_n, options = {})
    defaults = { width: 100, aspect: 's' }
    options = defaults.merge(options)
    "#{ENDPOINT}#{name_n}?width=#{options[:width]}&aspect=#{options[:aspect]}"
  end

  def self.post(name_n, &block)
    # TODO...
  end
end
