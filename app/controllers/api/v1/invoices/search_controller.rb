class Api::V1::Invoices::SearchController < ApplicationController
  def show
    render json: Invoice.find_by(checkparams.to_sym => params[checkparams])
  end

  private
  def checkparams
    params.keys.first
  end
end
