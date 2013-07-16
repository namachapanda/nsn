class Company < ActiveRecord::Base
  attr_accessible :code, :domain_id, :name, :schema_code, :status_id
end
