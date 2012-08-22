class SitecontactsController < ApplicationController
  def index
    redirect_to new_sitecontact_path
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
      #ENVIA EMAIL
      UserMailer.send_contact(@sitecontact).deliver
      redirect_to @sitecontact, :notice => "Successfully created sitecontact."
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
      redirect_to @sitecontact, :notice  => "Successfully updated sitecontact."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sitecontact = Sitecontact.find(params[:id])
    @sitecontact.destroy
    redirect_to sitecontacts_url, :notice => "Successfully destroyed sitecontact."
  end
end
