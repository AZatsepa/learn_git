class Post < ActiveRecord::Base
  belongs_to :user

  scope :draft, -> { where(status: 'draft') }
  scope :posted, -> { where(status: 'posted') }

  validates :title, presence: true
end
