require 'rails_helper'

RSpec.describe RemoveSubscription, type: :interactor do

  before(:example) do
    Subscription.destroy_all
  end

  describe '.call' do
    context "when called with a valid city and email" do
      it "removes the corresponding record from database if the record exists" do
        AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")

        interactor = RemoveSubscription.call(email: "aboderinemmanuel@gmail.com", city: "London")

        expect(interactor).to be_a_success
        expect(Subscription.find_by(email: "aboderinemmanuel@gmail.com")).to eq(nil)
      end
    end

    context "when called with an invalid city and/or email" do
      it "does nothing" do
        AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")

        interactor = RemoveSubscription.call(email: "aboderinemmanuelll@gmail.com", city: "London")

        expect(interactor).to be_a_failure
        expect(Subscription.find_by(email: "aboderinemmanuel@gmail.com").email).to eq("aboderinemmanuel@gmail.com")
      end
      it "does nothing" do
        AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")

        interactor = RemoveSubscription.call(email: "aboderinemmanuel@gmail.com", city: "Londonn")

        expect(interactor).to be_a_failure
        expect(Subscription.find_by(email: "aboderinemmanuel@gmail.com").email).to eq("aboderinemmanuel@gmail.com")
      end
      it "does nothing" do
        AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")

        interactor = RemoveSubscription.call(email: "aboderinemmanuelll@gmail.com", city: "Londonn")

        expect(interactor).to be_a_failure
        expect(Subscription.find_by(email: "aboderinemmanuel@gmail.com").email).to eq("aboderinemmanuel@gmail.com")
      end
    end
  end
end
