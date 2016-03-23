require 'hanami/interactor'

class EventCreator
  include Hanami::Interactor

  expose :event

  def initialize(params:, owner:, repository: EventRepository)
    @event      = Event.new({ owner_id: owner.id }.merge(params.get('event')))
    @repository = repository
  end

  def call
    persist_event
  end

  private

  def persist_event
    @event = @repository.create(@event)
  rescue Hanami::Model::UniqueConstraintViolationError
    error! OpenStruct.new(attribute_name: :name, validation: 'already exists')
  end
end
