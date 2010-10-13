class GigsController < ApplicationController
  respond_to :html

  def index
    @gigs = Gig.all
    respond_with @gigs
  end

  def show
    @gig = Gig.find(params[:id])
    respond_with @gig
  end

  def new
    @gig = Gig.new
    if user_signed_in?
      @gig.contact_first_name ||= current_user.first_name
      @gig.contact_last_name ||= current_user.last_name
      @gig.contact_email ||= current_user.email
    end
    
    respond_with @gig
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def create
    @gig = Gig.new(params[:gig])
    @gig.creator ||= current_user

    if @gig.save
      flash[:notice] = 'Gig was successfully created.'
    end
      
    respond_with @gig
  end

  def update
    @gig = Gig.find(params[:id])

    if @gig.update_attributes(params[:gig])
      flash[:notice] = 'Gig was successfully updated.'
    end
    
    respond_with @gig
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    
    respond_with @gig
  end
end
