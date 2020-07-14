class ServicesController < ApplicationController
  
  before_action :set_service, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorized, only: [:listing, :pricing, :description, :photo_upload, :amenities, :location, :update]

  def index
    @services = current_user.services
  end

  def new
    @service = current_user.services.build
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to listing_service_path(@service), notice: "Serviço salvo sucesso."
    else
      flash[:alert] = "O cadastro do serviço não foi realizado."
    end

  end

  def listing
    
  end

  def pricing

  end

  def description
   
  end

  def photo_upload
    @photos = @service.photos
  end

  def amenities
  end

  def location
  end

  def show     
    @photos = @service.photos
    @guest_review_services = @service.guest_review_services
  end

  def update
    new_params = service_params
    new_params = service_params.merge(active: true) if is_ready_service

    if @service.update(new_params)
      flash[:notice] = "Serviço alterado com sucesso."
    else
      flash[:alert] =  "A alteração do serviço não foi realizada."
    end
    redirect_to :back
  end

  

  private

    

    def set_service
      @service = Service.find(params[:id])
    end

    def is_authorized
      redirect_to root_path flash[:alert] =  "Você não tem permissão para realizar esta operação." unless current_user.id == @service.user_id
      
    end

    def is_ready_service
      !@service.active && !@service.price.blank? && !@service.listing_name.blank? && !@service.photos.blank? && !@service.address.blank?
    end

    def service_params
      params.require(:service).permit(:service_category, :service_type, :service_mode, 
        :payment_period, :listing_name, :summary, :address, 
        :is_independent, :is_legal_person, :has_invoice,
         :has_garantee, :price, :active)      
    end

    
end
