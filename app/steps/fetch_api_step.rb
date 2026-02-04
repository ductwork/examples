# frozen_string_literal: true

require "net/http"
require "uri"

class FetchApiStep < Ductwork::Step
  def initialize(*)
  end

  def execute
    uri = URI.parse("http://ipv4.download.thinkbroadband.com/20MB.zip")
    Net::HTTP.get(uri)
  end
end
