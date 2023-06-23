class Role < ApplicationRecord

  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :users

  before_save :set_slug


  def set_slug
    self.slug = self.name.downcase
  end
end
