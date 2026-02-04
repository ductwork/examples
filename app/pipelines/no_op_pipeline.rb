# frozen_string_literal: true

class NoOpPipeline < Ductwork::Pipeline
  define do |pipeline|
    pipeline.start(NoOpStep)
  end
end
