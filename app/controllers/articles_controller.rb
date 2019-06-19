class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:new]

  def index
    # @article = Article.paginate(page: params[:page], per_page: 5)

    if params[:search]
      @article = Article.search(params[:search]).paginate(:page => params[:page], :per_page => 2)
      # @users = User.search(params[:search]).order("created_at DESC")
    else
      @article = Article.paginate(page: params[:page], per_page: 2)
      # @user_paginate = false;
    end

  end

  def show

  end

  def new
    @article = Article.new
  end

  def edit
    if @article.user != current_user
      flash[:warning] = "You cant modify another user account"
      redirect_to article_path(@article)
      end
  end

  def destroy

    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      flash[:notice] = "The article was succefully created"
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def update

    if @article.update(articles_params)
      flash[:success] = "Article was updated"
      redirect_to article_path(@article)
    else
      flash[:danger] = "Article was not updated"
      render 'edit'
    end
  end

  private

    def articles_params
      params.require(:article).permit(:title, :description)
    end

  def set_article
    @article = Article.find(params[:id])
  end


end
