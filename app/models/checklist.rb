class Checklist < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }

  belongs_to :author, class_name: User
  has_many :items, dependent: :destroy
  has_and_belongs_to_many :users

end
