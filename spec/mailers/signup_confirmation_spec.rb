require "rails_helper"

RSpec.describe SignupConfirmation, :type => :mailer do

  user = FactoryGirl.create(:user)

  describe "welcome" do
    let(:mail) { SignupConfirmation.welcome(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Hooray Beer!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Welcome #{user.username}! Crack open a beer - we need your review!")
    end
  end

end
