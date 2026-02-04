# frozen_string_literal: true

require "net/http"
require "uri"

class ApiExpandingPipeline < Ductwork::Pipeline
  define do |pipeline|
    pipeline.start(MultiplexStep).expand(to: FetchApiStep)
  end
end
