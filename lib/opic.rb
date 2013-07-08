require 'singleton'
require "rest_client"

class Opic
  include Singleton

  class << self
    def api_key
      @api_key ||= nil
    end

    def api_key=(api_key)
      @api_key = api_key
    end

    def endpoint
      @endpoint ||= "https://opic.osu.edu/"
    end

    def endpoint=(endpoint)
      @endpoint = endpoint
    end

    def get(name_n, options = {})
      defaults = { width: 100, aspect: 's' }
      options = defaults.merge(options)
      "#{@endpoint}#{name_n}?width=#{options[:width]}&aspect=#{options[:aspect]}"
    end

    # TODO: I don't like the fact that we're using rest_client here...I would
    # rather use net/http because it's part of the ruby stdlib

    def post(name_n, path)
      begin
        raise "API Key not set!" if @api_key.nil?

        headers = { "X-API-Key" => @api_key }
        data = { avatar: File.new(path), name_n: name_n }

        r = RestClient.post("#{@endpoint}/api/avatars", data, headers)
        return false unless r.code == 201
      rescue => e
        return false
      end
      return true
    end
  end

end
