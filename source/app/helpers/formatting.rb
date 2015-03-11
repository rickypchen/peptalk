helpers do
  def em(text)
    "<em>#{text}</em>"
  end

  def display_errors
    if flash[:error]
      flash[:error].to_sentence
    end
  end
end
