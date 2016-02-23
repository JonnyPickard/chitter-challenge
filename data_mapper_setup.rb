require 'data_mapper'

require_relative 'app/models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge")
DataMapper.finalize
DataMapper.auto_migrate!
