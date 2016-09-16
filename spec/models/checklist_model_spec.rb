require 'rails_helper'


describe Checklist do

  let(:gary) { User.new(username: 'gary', password: '12345') }
  let(:kate) { User.new(username: 'kate', password: '12345') }
  subject(:garys_checklist) { Checklist.new(title: 'Gary\'s Checklist', author: gary) }

  context 'validations' do
    it { should validate_presence_of(:title) }

    it { should validate_length_of(:title).is_at_least(3) }
  end

  context 'associations' do
    it { should have_and_belong_to_many(:users) }
    it { should have_many(:items) }
    it { should belong_to(:author) }
  end

  it 'can be edited by author' do
    expect(gary.can_edit?(garys_checklist)).to be true
  end

  it 'cannot be edited by non-author' do
    garys_checklist.users << kate # This relationship shouldn't grant :kate edit privileges
    expect(kate.can_edit?(garys_checklist)).to be false
  end

  it 'can be deleted by author' do
    expect(gary.can_delete?(garys_checklist)).to be true
  end

  it 'cannot be deleted by non-author' do
    garys_checklist.users << kate # This relationship shouldn't grant :kate delete privileges
    expect(kate.can_delete?(garys_checklist)).to be false
  end

end