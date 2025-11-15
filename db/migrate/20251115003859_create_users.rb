# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :favorite_food
      t.timestamp :last_enriched_at
      t.timestamps
    end
  end
end
