class ApplicationController < ActionController::API
  def clean_params_checker(clean_params)
    if clean_params[:unit_price]
      return_formatted_unit_price(clean_params)
    end
    clean_params
  end

  def format_unit_price(unit_price)
    unit_price.gsub('.', '')
  end

  def return_formatted_unit_price(clean_params)
    clean_params[:unit_price] = format_unit_price(clean_params[:unit_price])
  end
end
