require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "CREATION" do
    before(:each) do
      DatabaseCleaner.clean
    end
    it "must have a role" do
      @role = Role.create()
      expect(@role.valid?).to be false
    end
    it "must be unique" do
      2.times { Role.create(role: "samesies")}
      expect(Role.where("role = ?", "samesies").length).to be 1
    end
  end
end
