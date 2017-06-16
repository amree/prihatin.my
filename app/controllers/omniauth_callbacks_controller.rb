class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if user = GetUserFromOauth.for(request.env["omniauth.auth"])
      sign_in_and_redirect user, event: :authentication
    else
      session["devise.omniauth_data"] =
        request.env["omniauth.auth"].except("extra")

      redirect_to new_user_registration_url
    end
  end
end
