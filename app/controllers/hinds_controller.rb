class HindsController < ApplicationController
  before_filer :authenticate_user!, :only => [:create][:destroy]
  
  def show
  end
  
  def create
    @hind = Hind.create(params[:hind])
    @hind.post_id = params[:id]
  end
  
  def destroy
  end

end
