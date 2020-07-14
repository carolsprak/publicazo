module ApplicationHelper
  def avatar_url(user)
    	
    if user.image 
    	"http://graph.facebook.com/#{user.uid}/picture?type=large"
    else
    	gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    	"http://www.gravatar.com/avatar/#{gravatar_id}"
    end
  end
end
