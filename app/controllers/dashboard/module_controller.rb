class Dashboard::ModuleController < ActionController::Base
  before_action :authenticate_user!
  before_action :subscriber_only


  protected
    #
    #
    def subscriber_only
      redirect_with_permission_error unless current_user.has_role?(:subscriber)
    end
end
