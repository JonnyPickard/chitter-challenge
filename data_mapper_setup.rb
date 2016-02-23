require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'

require_relative 'app/models/user'
require_relative 'app/models/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge")
DataMapper.finalize
#DataMapper.auto_migrate!
DataMapper.auto_upgrade!
