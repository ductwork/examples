# frozen_string_literal: true

class EnrichAllUsersDataPipeline < Ductwork::Pipeline
  define do |pipeline|
    pipeline.start(QueryUsersRequiringEnrichment)
            .expand(to: LoadUserData)
            .divide(to: [ FetchDataFromSourceA, FetchDataFromSourceB ])
            .combine(into: CollateUserData)
            .chain(UpdateUserData)
            .collapse(into: ReportUserEnrichmentSuccess)
  end
end
