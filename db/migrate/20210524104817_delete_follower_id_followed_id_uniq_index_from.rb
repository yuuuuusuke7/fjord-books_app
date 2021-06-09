# frozen_string_literal: true

class DeleteFollowerIdFollowedIdUniqIndexFrom < ActiveRecord::Migration[6.1]
  def down
    remove_index :relationships, name: 'index_relationships_on_follower_id_and_followed_id'
  end
end
