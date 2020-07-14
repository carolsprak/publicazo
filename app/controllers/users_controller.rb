class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@services = @user.services 	
  	@services_active = Service.where(active: 't', user_id: @user.id)

  	# Exibir a avaliação do usuário (se o usuario for um host)
  	@guest_review_services = ReviewService.where(type: "GuestReviewService", host_id: @user.id)

  	# Exibir a avaliação do usuário (se o usuario for um guest)
  	@host_review_services = ReviewService.where(type: "HostReviewService", guest_id: @user.id)
  	
  end
end