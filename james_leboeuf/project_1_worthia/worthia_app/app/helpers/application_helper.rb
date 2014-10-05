module ApplicationHelper
  def intellinav
    nav = ''
    if @current_user.present?
      nav += "<li>Hello #{ @current_user.name }</li> "
      nav += "<li>" + link_to('All users', users_path) + "</li> "
      nav += "<li>" + link_to('Edit profile', edit_user_path) + "</li> "
      nav += "<li>" + link_to('Add item', new_item_path) + "</li> "
      nav += "<li>#{ link_to('Sign out', login_path, :method => :delete, :data => {:confirm => 'Are you sure?'}) }</li> "
      nav += "<li>" + link_to('My Profile', user_path(@current_user)) + "<li> "
    else
      nav += "<li>#{ link_to('Sign up', new_user_path) }</li> "
      nav += "<li>#{ link_to('Sign in', login_path) }</li>"
    end
    nav
  end
end
