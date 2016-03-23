require 'sequel'
require 'sequel/extensions/pg_array'
require 'hanami/model/coercer'

class PGCITextArray < Hanami::Model::Coercer
  def self.dump(value)
    return nil if value.nil?
    ::Sequel.pg_array(value, :citext)
  end

  def self.load(value)
    return nil if value.nil?
    return value if value.is_a? ::Sequel::Postgres::PGArray

    ::Sequel::Postgres::PGArray::Parser.new(value).parse
  end
end
