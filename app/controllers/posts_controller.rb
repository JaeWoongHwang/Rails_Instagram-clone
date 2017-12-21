class PostsController < ApplicationController
  # before_action :authorize

  def index
    @post = Post.all.reverse
  end

  def create
    Post.create(
      # user_id: current_user.id,
      title:  params[:title],
      content:  params[:content],
      avatar: params[:avatar]
    )

    # redirect_to '/' #코드의 가시성 때문에 /보다 root_path 사용을 권장
    redirect_to root_path

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content]
    )
    redirect_to "/posts/show/#{params[:id]}"
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

end
