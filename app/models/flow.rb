class Flow < ActiveRecord::Base
  attr_accessible :name
  
  has_many :nodes
end
