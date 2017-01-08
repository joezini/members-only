module PostsHelper

  def find_username(user_id)
    User.find_by(id: user_id).username
  end
  
end
