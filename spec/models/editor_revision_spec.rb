require 'rails_helper'

RSpec.describe EditorRevision, type: :model do
  describe "CREATION" do
    before(:each) do
      DatabaseCleaner.clean
      @author = Employee.new(first_name: "hj", last_name: "welles")
      @updater = Employee.new(first_name: "ww", last_name: "sprawlins")
      @article1 = Article.create(title: "testing updates", content: "This is a 10 word sentence so will pass validation.")
      @article2 = Article.create(title: "testing updates", content: "This is a 10 word sentence so will pass validation.")
      @author.articles << @article1
      @author.articles << @article2

    end
    it "must contain content" do
      @empty_revision = EditorRevision.create(reviewer: @updater, article: @article1)
      @good_revision = EditorRevision.create(reviewer: @updater, article: @article2, content: "This is an revision")
      expect(@empty_revision.valid?).to be false
      expect(@good_revision.valid?).to be true
    end
  end
end
