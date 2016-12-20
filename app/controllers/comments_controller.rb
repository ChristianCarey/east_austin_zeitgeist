class CommentsController < ApplicationController
  def index
    @comments = Comment.filter(params[:category])
  end
end
