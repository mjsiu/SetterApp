require 'rails_helper'

RSpec.describe Goal, type: :model do

  let(:user) {User.create!(username: "Jeff", password: "asdfas")}

  describe "needs to exist" do
    it "exists" do
      user = User.create!(username: "Jeff", password: "asdfas")
      user.goals.create(title: "title", body: "this is the body", visiblity: "private")

      expect(Goal.find_by(title: "title")).to be_valid
    end

    it "check your validation" do
      user.goals.create
      expect(Goal.find_by(title: "title")).to be_nil
    end
  end



end
