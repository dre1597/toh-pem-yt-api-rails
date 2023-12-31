# frozen_string_literal: true

class CreateHeroes < ActiveRecord::Migration[7.1]
  def change
    create_table :heroes do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
