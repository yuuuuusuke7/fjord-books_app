# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to url_for(@commentable), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render "#{@resource}/show", notice: t('errors.messages.empty', name: Comment.model_name.human)
    end
  end

  private

  def set_commentable
    @resource, id = request.path.split('/')[1, 2]
    @commentable = @resource.singularize.classify.constantize.find(id)
    instance_variable_set("@#{@resource.singularize}", @commentable)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
