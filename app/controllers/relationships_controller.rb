# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find_by_id(params[:follow_id])
    current_user.follow(params[:follow_id])
    redirect_to user_path(user)
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to user_path
  end
end
