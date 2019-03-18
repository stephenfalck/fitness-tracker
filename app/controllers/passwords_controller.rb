class PasswordsController < Devise::PasswordsController
    protected
      def after_resetting_password_path_for(resource)
        activities_path
      end
  end