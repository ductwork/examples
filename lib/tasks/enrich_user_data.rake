# frozen_string_literal: true

desc "Enrich data for all users for the given time window"
task enrich_user_data: :environment do
  days_outdated = 7

  pipeline = EnrichAllUsersDataPipeline.trigger(days_outdated)

  puts "Created pipeline with ID: #{pipeline.id}"
end
