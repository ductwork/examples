# frozen_string_literal: true

class ExpandingPipeline < Ductwork::Pipeline
  define do |pipeline|
    pipeline.start(MultiplexStep).expand(to: NoOpStep)
  end
end
