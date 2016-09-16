require 'rails_helper'


describe Item do
  let(:gary) { User.new(username: 'gary', password: '12345') }
  let(:kate) { User.new(username: 'kate', password: '12345') }
  let(:garys_checklist) { Checklist.new(title: 'Gary\'s Checklist', author: gary) }
  subject(:garys_item) { Item.new(checklist: garys_checklist, text: 'some text') }

  context 'validations' do
    it { should validate_presence_of(:text) }
  end

  context 'associations' do
    it { should belong_to(:checklist) }
  end

  it 'can be edited by author' do
    expect(gary.can_edit?(garys_item)).to be true
  end

  it 'cannot be edited by non-author' do
    garys_checklist.users << kate # This relationship shouldn't grant :kate edit privileges
    expect(kate.can_edit?(garys_item)).to be false
  end

  it 'can be deleted by author' do
    expect(gary.can_delete?(garys_item)).to be true
  end

  it 'cannot be deleted by non-author' do
    garys_checklist.users << kate # This relationship shouldn't grant :kate delete privileges
    expect(kate.can_delete?(garys_item)).to be false
  end
end