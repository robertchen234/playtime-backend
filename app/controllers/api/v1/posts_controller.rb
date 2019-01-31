class Api::V1::PostsController < ApplicationController
  before_action :find_post, only: [:update, :destroy]
  def index
    @posts = Post.all
    render json: @posts
  end
  def create
    @post = Post.create(post_params)
    render json: @post, status: :accepted
  end
  def update
    @post.update(post_params)
    if @post.save
      render json: @post, status: :accepted
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessible_entity
    end
  end
  def destroy
    @post = Post.destroy
    render json: { message: “removed” }, status: :ok
  end
  private

  def post_params
    params.permit(:postname)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end