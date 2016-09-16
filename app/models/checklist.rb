class Checklist < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }

  belongs_to :author, class_name: User
  has_many :items, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  def can_be_edited_by?(user)
    user == self.author
  end

  def can_be_deleted_by?(user)
    user == self.author
  end
end
