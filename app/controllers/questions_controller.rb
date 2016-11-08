class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end


  def new
    @question = Question.new
  end

  def create
    @question = Question.create(questions_params)
    if @question.save
      redirect_to root_path notice: "Pregunta publicada con exito"
    else
      render :new
    end
  end


  def show
    @question = Question.find(params[:id])
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
