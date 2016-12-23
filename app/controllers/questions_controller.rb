class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show ]

  def index
    if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order("created_at DESC")
    end
  end


  def new
    @question = Question.new

  end

  def create
    @question = Question.create(questions_params)
    @question.user = current_user
    if @question.save
      redirect_to root_path notice: "Pregunta publicada con exito"
    else
      render :new
    end
  end


  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new

  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(questions_params)
      redirect_to root_path, notice: "Pregunta actualizada correctamente"
    else
      render :edit
    end
  end
  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to root_path, notice:"Pregunta eliminada con exito"
  end



  private
  def questions_params
    params.require(:question).permit(:title, :description)
  end


end
