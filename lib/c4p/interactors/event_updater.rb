require 'hanami/interactor'

class EventUpdater
  include Hanami::Interactor

  expose :event

  def initialize(event:, params:, repository: EventRepository)
    @event      = event
    @params     = params
    @repository = repository
  end

  def call
    persist_event
  end

  private

  def persist_event
    @event.update @params.get('event')
    @event = @repository.update(@event)
  rescue Hanami::Model::UniqueConstraintViolationError
    error! OpenStruct.new(attribute_name: :name, validation: 'already exists')
  end
end
