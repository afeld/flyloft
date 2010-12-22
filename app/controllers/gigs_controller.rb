class GigsController < ApplicationController
  respond_to :html, :rss, :atom, :xml
  before_filter :authenticate_user!, :except => [:index, :show]
  
  sortable_attributes :created_at, :title, :expire_at, :city, :org => 'orgs.name'

  def index
    @gigs = Gig.paginate :page => params[:page], :order => sort_order, :include => :org
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
    
    respond_with @gig do |format|
      if @gig.persisted? and @gig.company.present?
        format.html { redirect_to [new_org_path, "?name=#{@gig.company}&gig_id=#{@gig.id}"].join }
      end
    end
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
