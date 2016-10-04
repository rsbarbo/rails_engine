class APi::V1::BaseController < ApplicationController
  def random(table_name)
    table_name.order("RANDOM()").take
  end
end
