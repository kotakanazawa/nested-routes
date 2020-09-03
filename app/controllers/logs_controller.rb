class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  def index
    @logs = Log.all
  end

  def show
  end

  def new
    @article = Article.find(params[:article_id])
    @log = Log.new
  end

  def edit
  end

  def create
    @log = Log.new(log_params)
    @log.article_id = params[:article_id]

    if @log.save
      redirect_to article_path(@log.article_id), notice: 'Log was successfully created.'
    else
      render :new
    end
  end

  def update
    if @log.update(log_params)
      redirect_to article_path(@log.article_id), notice: 'Log was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @log.destroy
      redirect_to article_path(@log.article_id), notice: 'Log was successfully destroyed.'
  end

  private
    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.require(:log).permit(:title, :article_id)
    end
end
