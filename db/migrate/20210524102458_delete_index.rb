# frozen_string_literal: true

class DeleteIndex < ActiveRecord::Migration[6.1]
  def down
    remove_index :relationships, name: 'index_relationships_on_followed_id'
    remove_index :relationships, name: 'index_relationships_on_follower_id'
    add_index :relationships, %i[follower_id followed_id], unique: true
  end
end
