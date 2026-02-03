# frozen_string_literal: true

class ReportUserEnrichmentSuccess < Ductwork::Step
  def initialize(*)
    # we don't always have to care about the input argument.
    # for instance, we know the all the previous steps are
    # guaranteed to have succeeded to have gotten to this step
  end

  def execute
    Rails.logger.info("User enrichment finished")
  end
end
