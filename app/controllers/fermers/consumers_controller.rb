class Fermers::ConsumersController < ApplicationController
	layout 'fermer'
  def index
  end
  def show
  	@consumer = Consumer.find(params[:id])
  end
  private
  def consumer_params
       params.require(:consumer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name,:gender,:age,:prefecture_code, :address_city,:address_street,:address_building, :postcode, :phone, :email,:withdraw)
  end
end
