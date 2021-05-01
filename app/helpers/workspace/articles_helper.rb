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

  # TODO get_tags is an untested method!!
  def get_tags(article)
    unless article.tags.empty?
      article_tags = []
      article.tags.each do |tag|
        article_tags << tag.tag
      end
      article_tags.join(", ")
    end

  end

  # TODO set_tags is an untested method!!
  def set_tags(article, tag_string)
    article.tags.
    tags = tag_string.split(", ")
    tags.each do |tag|
      article << Tag.find_or_create_by(tag: tag)
    end
  end

end
