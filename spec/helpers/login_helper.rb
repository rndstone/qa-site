module LoginHelper
  def sign_in(user)
    if user.authenticate(user.password)
      session[:user_id] = user.id
    end
  end
end