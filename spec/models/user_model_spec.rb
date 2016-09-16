require 'rails_helper'


describe User do

  subject(:gary) { User.new(username: 'gary', password: '12345') }

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:username).is_at_least(3) }
  end

  context 'associations' do
    it { should have_many(:authored_checklists) }
    it { should have_and_belong_to_many(:checklists) }
  end

  it 'should find users by username and password' do
    # TODO get this working
    # expect(User.find_by_credentials('gary', '12345')).to eq(gary)
  end

  it 'should save passwords as BCrypt digests' do
    gary.password = 'abcdef'
    expect(BCrypt::Password.new(gary.password_digest).is_password?('abcdef')).to be true
  end

  it 'should reset session token when gary.reset_token! is called' do
    session_token = gary.session_token
    gary.reset_token!
    expect(session_token).not_to eq(gary.session_token)
  end

  it 'should be identify valid passwords' do
    gary.valid_password?('12345')
  end
end