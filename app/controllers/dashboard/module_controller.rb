class Dashboard::ModuleController < ActionController::Base
  append_before_action :authenticate_user!
  append_before_action :subscriber_only


  protected
    #
    #
    def subscriber_only
      redirect_with_permission_error unless current_user.has_role?(:subscriber)
    end
end
