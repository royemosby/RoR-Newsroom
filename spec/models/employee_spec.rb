require 'rails_helper'

RSpec.describe Employee, type: :model do

  describe "CREATION" do
    before(:each) do
      DatabaseCleaner.clean
    end

    
    it "must have a username" do
      @employee = Employee.create(first_name: "NoLast", last_name: "NoFirst", password: "pw")
      expect(@employee.valid?).to be false
      
      @employee = Employee.create(username: "something", first_name: "NoLast", last_name: "NoFirst", password: "pw")
      expect(@employee.valid?).to be true
    end
    
    it "must have a password" do
      @employee = Employee.create(first_name: "no", last_name: "pw")
      expect(@employee.valid?).to be false
    end
    
  end

  describe "ACTIONS UPON" do

    before(:all) do
      DatabaseCleaner.clean
      @employee = Employee.create!(username: "un", first_name: "Firsty", last_name: "McLasty", password: "password")
      roles = ["create", "approve", "assign", "edit", "review", "publish"]
      roles.each { |r| Role.create!(role: r)}
      @roles = Role.all
      @unassigned_article = Article.create(title: "Unassigned", content: Faker::Lorem.paragraphs(number: 2).join)
    end

    it "can be assigned roles" do
      @employee.roles << @roles.first
      @employee.roles << @roles.second
      expect(@employee.roles.first).to eq(@roles.first)
      expect(@employee.roles.last).to eq(@roles.second)
      expect(@employee.roles.length).to be 2
    end

    it "can be associated to articles" do
      @employee.articles << @unassigned_article
      expect(@employee.articles.length).to be 1
    end

  end
  
  describe "PERFORM ACTIONS" do 

    before(:all) do
      DatabaseCleaner.clean
      @employee = Employee.create!(username: "un", first_name: "Firsty", last_name: "McLasty", password: "password")
      roles = ["create", "approve", "assign", "edit", "review", "publish"]
      roles.each { |r| Role.create!(role: r)}
      @roles = Role.all
      @sentence = "This is a 10 word sentence so will pass validation."
      @some_article = Article.create(title: "Unassigned", content: @sentence)
    end

    it "can create new articles" do
      @employee.articles << Article.create!(title: "created_by", content: @sentence)
      expect(@employee.articles.length).to be 1
    end

    it "can create editor_revision" do
      @employee.editor_revisions << EditorRevision.create(content: @sentence, article: @some_article)
      expect(@employee.editor_revisions.length).to be 1
      expect(@some_article.editor_revisions.first).to eq(@employee.editor_revisions.first)
    end

    it "can create article_updates" do
      @employee.article_updates << ArticleUpdate.create(content: @sentence, article: @some_article)
      expect(@employee.article_updates.length).to be 1
      expect(@some_article.article_updates.first).to eq(@employee.article_updates.first)
    end
  end
end

