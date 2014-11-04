require 'active_record'
require 'alive_state'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
