class PagesController < ApplicationController

  def home
    @services = Service.where(active: true).limit(3)
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      #@services_address = Service.where(active: true).near(session[:loc_search], 5, order: 'distance')
    #else
      @services_address = Service.where(active: true).all
    end

    # STEP 3
    @search = @services_address.ransack(params[:q])
    @services = @search.result

    @arrServices = @services.to_a

    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @services.each do |service|

        not_available = service.reservation_services.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1)

        if not_available.length > 0
          @arrServices.delete(service)
        end
      end
    end

  end
end
