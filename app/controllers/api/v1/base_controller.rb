class Api::V1::BaseController < ApplicationController
  def random(table_name)
    table_name.order("RANDOM()").take(1)
  end
end
