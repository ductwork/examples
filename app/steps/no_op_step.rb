# frozen_string_literal: true

class NoOpStep < Ductwork::Step
  def initialize(*)
  end

  def execute
    nil
  end
end
