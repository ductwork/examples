# frozen_string_literal: true

class CpuExpandingPipeline < Ductwork::Pipeline
  define do |pipeline|
    pipeline.start(MultiplexStep).expand(to: CpuWorkStep)
  end
end
