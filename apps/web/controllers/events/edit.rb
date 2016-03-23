module Web::Controllers::Events
  class Edit
    include Web::Action

    before :authenticate!

    expose :event

    def call(params)
      @event = EventRepository.find(params[:id])
      halt 404 if @event.nil?
    end
  end
end
