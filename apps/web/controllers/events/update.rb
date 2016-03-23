module Web::Controllers::Events
  class Update
    include Web::Action

    before :authenticate!

    params do
      param :id, presence: true

      param :event do
        param :name,        presence: true
        param :description, presence: true
      end
    end

    expose :event, :errors

    def initialize(interactor = EventUpdater, repository = EventRepository)
      @interactor = interactor
      @repository = repository
    end

    def call(params)
      return nil if !params.valid?

      @event = EventRepository.find(params[:id])
      halt 404 if @event.nil?

      @result = @interactor.new(event: @event, params: params).call
      @event  = @result.event

      if @result.success?
        flash[:success] = 'Successfully updated event' # TODO i18n?
        redirect_to routes.root_path
      end

      # TODO DRY
      def errors
        if params.errors.any?
          params.errors
        elsif @result.errors.any?
          @result.errors
        else
          []
        end
      end
    end
  end
end
