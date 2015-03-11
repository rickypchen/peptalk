helpers do
  def em(text)
    "<em>#{text}</em>"
  end

  def display_errors
    if flash[:registration_error]
      flash[:registration_error].to_sentence
    end
  end

end
