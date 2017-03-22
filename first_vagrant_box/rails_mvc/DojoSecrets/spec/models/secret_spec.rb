require 'rails_helper'

RSpec.describe Secret, type: :model do
  it 'requires content' do
    expect(build(:secret, user: build(:user), content: "")).to be_invalid
  end
  context 'relationships' do
    before do
      @user = create(:user)
      @secret = create(:secret, user: @user)
      @like = create(:like, secret: @secret, user: @user)
    end
    it 'belongs to a user' do
      expect(@secret.user).to eq(@user)
    end
    it 'can have likes' do
      expect(@secret.likes).to include(@like)
    end
    it 'has users through the likes table' do
      expect(@secret.users).to include(@user)
    end
  end
end
