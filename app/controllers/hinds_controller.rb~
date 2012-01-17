class HindsController < ApplicationController
#   before_filer :authenticate_user!, :only => [:create,:destroy]
#   before_filer doesnt work, not related directly to user
  def show
    hind = Hind.find(params[:id])
    search = hind.subject
    listings = Hind.where(":subjects = ?", params[:subject] )
  end
  
  def create
    @hind = Hind.create(params[:hind])
    @hind.subject.gsub!(/[ \t\r\n]/,"")
    @hind.save!                        
  end
  
  def destroy
  end

end
