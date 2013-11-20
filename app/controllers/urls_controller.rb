class UrlsController < ApplicationController
  def new
    @shortened_url = Url.new
  end

  def create 
    @shortened_url = Url.create(url_params)
    if @shortened_url.save
      flash[:shortened_id] = @shortened_url.id
      redirect_to new_url_path
    else
      render :new
    end
  end
  
  def show
    @shortened_url = Url.find(params[:id])
    redirect_to @shortened_url.url
  end

  def url_params
    params.require(:url).permit(:url)
  end




end
