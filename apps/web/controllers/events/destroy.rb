module Web::Controllers::Events
  class Destroy
    include Web::Action

    before :authenticate!

    expose :event

    def initialize(repository = EventRepository)
      @repository = repository
    end

    def call(params)
      @event = @repository.find(params[:id])
      halt 404 if @event.nil?

      @repository.delete @event

      redirect_to routes.root_path
    end
  end
end
