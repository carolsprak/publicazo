class HostReviewServicesController < ApplicationController
  
  def create
  	# Step 1: Check if the reservation_service exist (service_id, guest_id, guest_id)

    # Step 2: Check if the current guest already reviewed the host in this reservation_service.

    @reservation_service = ReservationService.where(
                    id: host_review_service_params[:reservation_service_id],
                    service_id: host_review_service_params[:service_id],
                    user_id: host_review_service_params[:guest_id]
                   ).first

    if !@reservation_service.nil?

      @has_reviewed = HostReviewService.where(
                        reservation_service_id: @reservation_service.id,
                        guest_id: host_review_service_params[:guest_id]
                      ).first

      if @has_reviewed.nil?
          # Allow to review
          @host_review_service = current_user.host_review_services.create(host_review_service_params)
          flash[:success] = "Avaliação realizada com sucesso."
      else
          # Already reviewed
          flash[:success] = "Você já avaliou esta reserva."
      end
    else
      flash[:alert] = "A reserva não foi encontrada."
    end

    redirect_to :back  	
  end

  def destroy
  	@host_review_service = ReviewService.find(params[:id]) if ReviewService.find(params[:id]).present?
  	@host_review_service.destroy

  	redirect_to :back
    flash[:alert] = "Avaliação removida!"
  end

  private
	  def host_review_service_params
	  	params.require(:host_review_service).permit(:comment, :star, :service_id, :reservation_service_id, :guest_id)
	  end
end	
