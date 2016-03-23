module Web::Controllers::Events
  class New
    include Web::Action

    before :authenticate!

    def call(*)
    end
  end
end
