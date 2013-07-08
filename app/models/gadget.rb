class Gadget < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :user
  has_many :images

  validates :name, :presence => true
  validates :description, :presence => true
end
