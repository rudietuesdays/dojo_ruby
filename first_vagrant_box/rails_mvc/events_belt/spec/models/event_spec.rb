require 'rails_helper'

RSpec.describe Event, type: :model do
  context "with valid attributes" do
    it "should save" do
      expect(build(:event, user: build(:user))).to be_valid
    end
  end

  context 'with invalid attributes it should not save if' do
    it 'name is blank' do
      expect(build(:event, name: '')).to be_invalid
    end
    it 'date is blank' do
      expect(build(:event, date: '')).to be_invalid
    end
    it 'date is in the past' do
      expect(build(:event, date: Date.parse('2017-08-20'))).to be_invalid
    end
    it 'city is blank' do
      expect(build(:event, city: '')).to be_invalid
    end
  end

  context 'relationships' do
    before do
      @user = create(:user)
      @event = create(:event, user: @user)
    end
    it 'belongs to a user' do
      expect(@event.user).to eq(@user)
    end
  end
end
