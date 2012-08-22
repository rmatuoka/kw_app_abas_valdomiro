class Admin::SitecontactsController < ApplicationController
  layout "inadmin"
  
  def index
    @sitecontacts = Sitecontact.all
  end

  def show
    @sitecontact = Sitecontact.find(params[:id])
  end

  def new
    @sitecontact = Sitecontact.new
  end

  def create
    @sitecontact = Sitecontact.new(params[:sitecontact])
    if @sitecontact.save
      redirect_to [:admin, @sitecontact], :notice => "Successfully created sitecontact."
    else
      render :action => 'new'
    end
  end

  def edit
    @sitecontact = Sitecontact.find(params[:id])
  end

  def update
    @sitecontact = Sitecontact.find(params[:id])
    if @sitecontact.update_attributes(params[:sitecontact])
      redirect_to [:admin, @sitecontact], :notice  => "Successfully updated sitecontact."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sitecontact = Sitecontact.find(params[:id])
    @sitecontact.destroy
    redirect_to admin_sitecontacts_url, :notice => "Successfully destroyed sitecontact."
  end
end
