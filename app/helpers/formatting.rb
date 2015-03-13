helpers do
  def em(text)
    "<em>#{text}</em>"
  end

  def question
    questions = ["What moves you?", "What inspires you?", "What is your spark?", "What is your greatest aspiration in life?", "What pumps you up?"]
    questions[rand(0..4)]
  end

end
