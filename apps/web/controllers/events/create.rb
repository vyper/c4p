module Web::Controllers::Events
  class Create
    include Web::Action

    before :authenticate!

    params do
      param :event do
        param :name,        presence: true
        param :description, presence: true
      end
    end

    expose :event, :errors

    def initialize(interactor = EventCreator)
      @interactor = interactor
    end

    def call(params)
      return nil if !params.valid?

      @result = @interactor.new(params: params, owner: current_user).call
      @event  = @result.event

      if @result.success?
        flash[:success] = 'Successfully created event' # TODO i18n?
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
