module NewsHelper

  def date_published(article)
    if article.published_date.nil?
      "This article has not been published yet."
    else
      article.published_date.strftime("Published %F")
    end
  end
end
