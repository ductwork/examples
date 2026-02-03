# frozen_string_literal: true

class CollateUserData < Ductwork::Step
  def initialize(data)
    @source_a_data = data[0]
    @source_b_data = data[1]
  end

  def execute
    # Imagine a more intelligent and complex algorithm here lol
    source_a_data.merge(source_b_data)
  end

  private

  attr_reader :source_a_data, :source_b_data
end
