class GigsController < ApplicationController
  respond_to :html, :rss, :atom, :xml

  def index
    @gigs = Gig.all
    respond_with @gigs
  end

  def show
    @gig = Gig.find(params[:id])
    if !user_signed_in? or current_user != @gig.creator
      @gig.view_count += 1
      @gig.save
    end
    
    respond_with @gig
  end

  def new
    @gig = Gig.new
    @gig.auditions.build
    
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
    @gig.enabled = false if params[:commit] =~ /draft/i

    if @gig.save
      if @gig.enabled
        flash[:notice] = 'Gig was successfully listed!'
      else
        flash[:notice] = 'Gig was successfully created.'
      end
    end
      
    respond_with @gig
  end

  def update
    @gig = Gig.find(params[:id])
    was_enabled = @gig.enabled
    @gig.enabled = true unless params[:commit] =~ /draft/i

    if @gig.update_attributes(params[:gig])
      if !was_enabled and @gig.enabled
        flash[:notice] = 'Gig was successfully listed!'
      elsif was_enabled and !@gig.enabled
        flash[:notice] = 'Gig was successfully unlisted.'
      else
        flash[:notice] = 'Gig was successfully updated.'
      end
    end
    
    respond_with @gig
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    
    respond_with @gig
  end
end
