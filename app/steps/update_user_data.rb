# frozen_string_literal: true

class UpdateUserData < Ductwork::Step
  def initialize(user_data)
    @user_data = user_data
  end

  def execute
    id = user_data["id"]
    user = User.find(id)

    ApplicationRecord.transaction do
      user.update!(**user_data)
      user.update!(last_enriched_at: Time.current)
    end

    Rails.logger.info("Persisted new data for user #{user.id}")

    nil
  end

  private

  attr_reader :user_data
end
