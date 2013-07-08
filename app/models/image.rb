class Image < ActiveRecord::Base
  attr_accessible :name, :file_name
  
  belongs_to :gadget
end
