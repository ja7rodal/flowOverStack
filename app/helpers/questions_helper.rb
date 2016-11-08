module QuestionsHelper
  def form_title
    @question.new_record? ? "Nueva Pregunta" : "Modificar Pregunta"
  end

  def form_submit
    @question.new_record? ? "Enviar Pregunta" : "Modificar la pregunta "
  end
end
