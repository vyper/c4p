module Web::Controllers::Events
  class Edit
    include Web::Action

    before :authenticate!

    expose :event

    def initialize(repository = EventRepository)
      @repository = repository
    end

    def call(params)
      @event = @repository.find(params[:id])
      halt 404 if @event.nil?
    end
  end
end
