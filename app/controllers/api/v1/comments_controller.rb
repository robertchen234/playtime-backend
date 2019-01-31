class Api::V1::CommentsController < ApplicationController

  skip_before_action :authorized, only: [:index]
  before_action :find_comment, only: [:update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = Comment.create(comment_params)
    render json: @comment, status: :accepted
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: “removed” }, status: :ok
  end

  private

  def comment_params
    params.require(:comment).permit(:player_post_id, :friend_post_id, :comment)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end