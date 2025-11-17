# frozen_string_literal: true

class FetchDataFromSourceB
  def initialize(user_data)
    @user_data = user_data
  end

  def execute
    # simulate a network request but faster than the other
    # parallel step to show they must both complete before
    # advancing forward
    sleep(0.1)

    user_data
      .with_indifferent_access
      .merge(remote_data)
  end

  private

  attr_reader :user_data

  # we're not actually fetching data from an API so we
  # just create random data
  def remote_data
    {
      name: Faker::Name.name,
      age: rand(21..99),
      favorite_food: Faker::Food.dish
    }
  end
end
