require 'sequel'
require 'sequel/extensions/pg_array'
require 'hanami/model/coercer'

class PGCITextArray < Hanami::Model::Coercer
  def self.dump(value)
    ::Sequel.pg_array(value, :citext)
  end

  def self.load(value)
    return nil if value.nil?
    ::Sequel::Postgres::PGArray::Parser.new(value).parse
  end
end
