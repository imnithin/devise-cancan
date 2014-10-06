class Node < ActiveRecord::Base
  attr_accessible :flow_id, :name, :node_id_parent, :duration, :node_id_task_starter, :parent_value, :type, :role_id, :sql

  belong_to :flow
  belongs_to :role
  has_many :tasks
  has_one :data_entry
  has_on :decision
  has_one :information
end
