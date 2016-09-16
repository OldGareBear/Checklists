class Item < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :checklist

  def can_be_edited_by?(user)
    user == self.checklist.author
  end

  def can_be_deleted_by?(user)
    user == self.checklist.author
  end

end
