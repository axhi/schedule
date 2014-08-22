helpers do 

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @user
    else
      @errors = "Invalid Login, please try again."
    end
  end

  def current_user
    @user ||= User.find(session[:user_id]) if is_logged_in?
  end

  def is_logged_in?
    session[:user_id]
  end

end