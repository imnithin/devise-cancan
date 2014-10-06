class Role < ActiveRecord::Base

  attr_accessible :name, :description

  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :users
  has_many :data_entries
  has_one :role_alternative
  has_one :node
  
end
