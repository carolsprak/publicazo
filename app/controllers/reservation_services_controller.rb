class ReservationServicesController < ApplicationController
	before_action :authenticate_user!

  def preload
    service = Service.find(params[:service_id])
    today = Date.today
    reservation_services = service.reservation_services.where("start_date >= ? OR end_date >= ?", today, today)
    
    for i in 0..reservation_services.size-1 do 
      puts reservation_services[i].id
    end

    render json: reservation_services
    
  end

  def preview
    
    start_date = Date.parse(params[:start_date]) 
    end_date = Date.parse(params[:end_date])    

    render json: is_conflict(start_date, end_date).to_s

  end

  def create
  	service = Service.find(params[:service_id])

  	if current_user == service.user
      flash[:alert] = "Você não pode reservar seu próprio serviço!"
    else
      if !is_conflict(reservation_service_params[:start_date], reservation_service_params[:end_date]) 
  	  	start_date = Date.parse(reservation_service_params[:start_date])
  	  	end_date = Date.parse(reservation_service_params[:end_date])
  	  	days =(end_date - start_date).to_i + 1

  	  	@reservation_service = current_user.reservation_services.build(reservation_service_params)
  	  	@reservation_service.service = service
  	  	@reservation_service.price = service.price
  	  	@reservation_service.total = service.price * days
  	  	@reservation_service.save

  	  	flash[:notice] = "Reserva realizada com sucesso!"
      else
        flash[:alert] = "Há datas em conflito!"
      end        
	 end
	  redirect_to service
  end

  def your_reservation_services
    @services = current_user.services
    
  end

  def your_contracted_services
    @contracted_services = current_user.reservation_services.order(start_date: :asc)
  end

  #def reservation_service_info
  #  @service = Service.find(params[:service_id])
  #  @photos = service.photos
  #  @reservation_service = ReservationService.find_by(service_id: params[:service_id], user_id: current_user.id)
 # end

  private

    def is_conflict(start_date, end_date)
      service = Service.find(params[:service_id])
      puts start_date
      puts end_date
      check = service.reservation_services.where("? < start_date AND end_date < ?", start_date, end_date)
      
      puts check.size
      puts check.size > 0? true : false

      check.size > 0? true : false
    end

  	def reservation_service_params 
  		params.require(:reservation_service).permit(:start_date, :end_date)  		
  	end
end