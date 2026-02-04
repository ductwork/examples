# frozen_string_literal: true

class NoOpJob < ApplicationJob
  def perform
    nil
  end
end
