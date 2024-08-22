class Users::SessionsController < Devise::SessionsController
  # Override the create action to add custom logic
  def create
    # Call the original Devise method to handle the session creation
    super

    # Custom logic after successful sign in
    if user_signed_in?
      # For example, you might want to log some information
      Rails.logger.info "User #{current_user.email} signed in at #{Time.current}"
      
      # Or set a flash message
      flash[:notice] = "Welcome back, #{current_user.name}!"
    end
  end

  # Optionally, you can also customize other Devise actions
  # For example, you might want to customize the destroy action (sign out)
  def destroy
    super
    flash[:notice] = "You have successfully signed out."
  end
end
