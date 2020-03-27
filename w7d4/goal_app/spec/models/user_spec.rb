require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject (:user) {FactoryBot.build"user"}

  it { should validate_presence_of (:username) }
  it { should validate_uniqueness_of (:username) }
  it { should validate_presence_of (:password_digest) }
  it { should validate_presence_of (:session_token) }
  it { should validate_uniqueness_of (:session_token) }

  describe 'ensure_session_token' do
    it 'ensures session_token is present' do
      expect(FactoryBot.create(:user).session_token).to_not be_nil
    end 
  end

  describe 'password encryption' do

    it 'does not save password to database' do
      user = FactoryBot.create(:user)
      expect(user.password).to_not be('123456')
    end

    it 'encrypts password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('123456')
      FactoryBot.build(:user, password: '123456')
    end
  end

  describe 'find by credentials' do 
    it "should find record by username and password" do 
      user = FactoryBot.create(:user, password: '123456') 
      expect(User.find_by_credentials(user.username, '123456')).to eq(true)
      #expect(User.find_by_credentials(session_token: user.session_token)).to eq(user)
    end 
  end
end
