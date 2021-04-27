require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "CREATION" do
    before(:each) do
      DatabaseCleaner.clean
    end
    it "title length at least 3 characters" do
      @too_short_title = Article.create(title: "no", content: "This is a 10 word sentence so will pass validation.")
      expect(@too_short_title.valid?).to be false
    end
    it "content length at least 10 words" do
      @too_short_content = Article.create(title: "Short of content", content: "This is a 9 word sentence which will fail.")
      expect(@too_short_content.valid?).to be false
    end
  end

  describe "ACTIONS UPON" do
    before(:all) do
      DatabaseCleaner.clean
      @article = Article.create(title: "long enough", content: "This is a 10 word sentence so will pass validation.")
      ["rails", "community"].each { |i| Tag.create(tag: i)}
      @tags = Tag.all
    end
    it "can have a tag added" do
      @article.tags << @tags.first
      expect(@article.tags.length).to be 1
    end

    it "can have several tags added" do
      @article.tags << @tags.second
      expect(@article.tags.length).to be 2
    end

    xit "each tag is unique" do

    end

    xit "can have editor_revisions appended" do

    end
    xit "can have updates appended"
  end
end
