class BusinessesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  private

  def sign_up_params
  	params.require(:business).permit()
  end

  def account_update_params
  	params.require(:business).permit()
  end
end
