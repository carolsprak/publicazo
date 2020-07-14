class GuestReviewServicesController < ApplicationController

  def create
    # Step 1: Check if the reservation_service exist (service_id, host_id, host_id)

    # Step 2: Check if the current host already reviewed the guest in this reservation_service.

    @reservation_service = ReservationService.where(
                    id: guest_review_service_params[:reservation_service_id],
                    service_id: guest_review_service_params[:service_id]
                   ).first

    if !@reservation_service.nil? && @reservation_service.service.user.id == guest_review_service_params[:host_id].to_i

      @has_reviewed = GuestReviewService.where(
                        reservation_service_id: @reservation_service.id,
                        host_id: guest_review_service_params[:host_id]
                      ).first

      if @has_reviewed.nil?
          # Allow to review
          @guest_review_service = current_user.guest_review_services.create(guest_review_service_params)
          flash[:success] = "Avaliação realizada com sucesso."
      else
          # Already reviewed
          flash[:success] = "Você já avaliou esta Reserva."
      end
    else
      flash[:alert] = "A Reserva não foi encontrada."
    end

    redirect_to :back
  end

  def destroy
    @guest_review_service = ReviewService.find(params[:id]) if ReviewService.find(params[:id]).present?
    @guest_review_service.destroy

    redirect_to :back
    flash[:alert] = "Avaliação removida!"
  end

  private
    def guest_review_service_params
      params.require(:guest_review_service).permit(:comment, :star, :service_id, :reservation_service_id, :host_id)
    end
end
