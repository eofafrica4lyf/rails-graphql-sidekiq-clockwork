require 'rails_helper'

RSpec.describe AddSubcription, type: :interactor do

  before(:example) do
    Subscription.destroy_all
  end

  describe '.call' do
    context "when called with a valid city and email" do

      it "adds a record to the database if no record already exist" do
        # Subscription.destroy_all
        interactor = AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")
        # puts interactor.subscription_made
        expect(interactor).to be_a_success
        expect(Subscription.find_by(email: "aboderinemmanuel@gmail.com").email).to eq("aboderinemmanuel@gmail.com")
      end
      # puts "Subscription.count"
      # puts Subscription.count
      it "fails if an existing record of the subscription exists" do
        interactor = AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")
        interactor = AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "London")
        expect(interactor).to be_a_failure
        expect(Subscription.count).to eq(1)
      end

    end
    context "when called with an invalid city" do

      it "it fails to add a record to the database" do
        # Subscription.destroy_all
        interactor = AddSubcription.call(email: "aboderinemmanuel@gmail.com", city: "Londonn")
        expect(interactor).to be_a_failure
        expect(Subscription.find_by(email: "aboderinemmanuel@gmail.com")).to eq(nil)
      end
      # puts "Subscription.count"
      # puts Subscription.count
      # it "adds a record to the database" do

      # end

    end
  end
end
