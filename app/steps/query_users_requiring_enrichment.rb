# frozen_string_literal: true

class QueryUsersRequiringEnrichment < Ductwork::Step
  def initialize(days_ago)
    @days_ago = days_ago
  end

  def execute
    relation = User.where("last_enriched_at < ?", days_ago.days.ago)

    if relation.none?
      Rails.logger.warn(msg: "No users need their data enriched")
    else
      Rails.logger.info(msg: "Enriching #{relation.count} users data")
    end

    relation.ids
  end

  private

  attr_reader :days_ago
end
