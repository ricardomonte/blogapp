module ApplicationHelper

  def display_error(article)
    if article.errors.any?
      content_tag(:h2, "Article coudnt be created")
    end
  end

  def list_errors(article)
    if article.errors.any?
      content_tag(:ul) do
        article.errors.full_messages.each do |msg|
          concat content_tag(:li, msg)
        end
      end
    end
  end

end
