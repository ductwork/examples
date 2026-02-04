# frozen_string_literal: true

class CpuWorkStep < Ductwork::Step
  def initialize(*)
  end

  def execute
    1_000_000.times { rand * rand }
  end
end
