module Workspace::ArticlesHelper

  def excerpt(article)
    if article.content.length < 144
      article.content
    else
      [article.content[0, 144], "..."].join
    end
  end

  def word_count(article)
    article.content.count(" ") + 1
  end

  # Too many source conflicts. Going with 250 wpm.
  def reading_time(article)
    pluralize(((word_count(article).to_f)/250).ceil, "minute")
  end

  def assigned_to(article)
    if article.employee.nil?
      "no one"
    else
      link_to article.employee.first_name, workspace_employee_path(article.employee_id)
    end
  end

end
