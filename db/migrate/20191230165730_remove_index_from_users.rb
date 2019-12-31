# frozen_string_literal: true

class RemoveIndexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :email
  end
end
