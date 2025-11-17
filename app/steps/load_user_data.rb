# frozen_string_literal: true

class LoadUserData
  def initialize(id)
    @id = id
  end

  def execute
    User
      .find(id)
      .attributes
      .slice("id", "name", "age", "favorite_food")
  end

  private

  attr_reader :id
end
