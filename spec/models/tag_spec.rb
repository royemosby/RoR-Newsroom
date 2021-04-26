require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "CREATION" do
    before(:each) do
      DatabaseCleaner.clean
    end
    it "must have a tag" do
      @tag = Tag.create()
      expect(@tag.valid?).to be false
    end
    it "must be unique" do
      2.times do
        Tag.create(tag: "samesies")
      end
      @samesies = Tag.where("tag = ?", "samesies")
      expect(@samesies.length).to be 1
    end 
    it "must be a single word" do
      @wordy_tag = Tag.create(tag: "contains multitudes")
      @good_tag = Tag.create(tag: "noooice")
      expect(@wordy_tag.valid?).to be false
      expect(@good_tag.valid?).to be true
    end
  end
end
