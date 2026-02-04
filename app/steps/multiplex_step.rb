# frozen_string_literal: true

class MultiplexStep < Ductwork::Step
  def initialize(step_count)
    @step_count = step_count
  end

  def execute
    (1..@step_count).to_a
  end
end
