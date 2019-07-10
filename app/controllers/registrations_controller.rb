class RegistrationsController < Devise::RegistrationsController
  protected

  # Customizing the Devise controller to redirect to profile edit after sign-up.
  def after_sign_up_path_for(resource)
    edit_profile_path(resource.profile)
  end
end
