class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    name = "熊木"
    messages = %W(
      #{name}さんの強みは？
      #{name}さんは何をしていたひと？
      #{name}さんとの関係は？
      #{name}さんの尊敬しているところは？
      #{name}さんの弱みをしいてあげるなら？
      #{name}さんは何をしているひと？
      #{name}さんのスキルは？
      あなたが#{name}さんの上司だったら、どんなポジションにアサインしますか？
  )
    @message = messages.sample
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      redirect_to("/posts/index")
    else
      redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end



end
