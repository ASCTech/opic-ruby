require 'singleton'
require "rest_client"
require 'pry'

class Opic
  include Singleton
  @endpoint = "https://opic.osu.edu/"
  singleton_class.class_eval do
    attr_accessor :api_key, :endpoint
  end

  class << self

    def get(name_n, options = {})
      defaults = { width: 100, aspect: 's' }
      options = defaults.merge(options)
      "#{@endpoint}#{name_n}?width=#{options[:width]}&aspect=#{options[:aspect]}"
    end

    # TODO: I don't like the fact that we're using rest_client here...I would
    # rather use net/http because it's part of the ruby stdlib

    def post(name_n, file)
      begin
        raise "API Key not set!" if @api_key.nil?

        # If we were passed only a path then make a File
        file = File.new(file) unless file.is_a? File

        headers = { "X-API-Key" => @api_key }
        data = { avatar: file, name_n: name_n }

        r = RestClient.post("#{@endpoint}api/avatars", data, headers)
        return false unless r.code == 201
      rescue => e
        return false
      end
      return true
    end
  end

end
