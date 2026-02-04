# frozen_string_literal: true

class ApiExpandingPipeline < Ductwork::Pipeline
  define do |pipeline|
    pipeline.start(MultiplexStep).expand(to: FetchApiStep)
  end
end
