require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :password, String

end
