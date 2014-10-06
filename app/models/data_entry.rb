class DataEntry < ActiveRecord::Base
  attr_accessible :node_id, :type, :name, :location, :rank, :multi, :mustfill, :role_id

  belongs_to :role
  has_many :js_editors
end
