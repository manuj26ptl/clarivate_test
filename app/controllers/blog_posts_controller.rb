class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /blog_posts
  def index
    @blog_posts = BlogPost.all
  end

  # GET /blog_posts/1
  def show; end

  # GET /blog_posts/new
  def new
    @blog_post = current_user.blog_posts.new
  end

  # GET /blog_posts/1/edit
  def edit; end

  # POST /blog_posts
  def create
    @blog_post = current_user.blog_posts.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blog_posts/1
  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blog_posts/1
  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.'
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :image)
  end
end
