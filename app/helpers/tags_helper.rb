module TagsHelper

  def news_tag_list(article)
    if article.tags.empty?
      "<span class='is-italic'>This article does not have any tags</span>".html_safe
    else
      article.tags.collect do |t|
        link_to "#{t.tag}", tag_path(t), class: "button is-link is-small ml-10", style: "pointer-events: none; margin-right: 5px;"
      end.join.html_safe
    end

  end
end
