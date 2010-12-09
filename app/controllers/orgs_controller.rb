class OrgsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @orgs = Org.all
    respond_with @orgs
  end

  def show
    @org = Org.find(params[:id])
    respond_with @org
  end

  def new
    @org = Org.new(:name => params[:name])
    @gig_id = params[:gig_id]
    respond_with @org
  end

  def edit
    @org = Org.find(params[:id])
  end

  def create
    @org = Org.new(params[:org])
    @org.contact_person ||= current_user
    
    if @org.save
      @org.members << current_user if user_signed_in?
      
      begin
        # associate with the gig
        gig = Gig.find(params[:gig][:id])
        gig.org = @org
        gig.save
      rescue
      end
      
      flash[:notice] = 'Org was successfully created.'
    end
    
    respond_with @org
  end

  def update
    @org = Org.find(params[:id])
    
    if @org.update_attributes(params[:org])
      flash[:notice] = 'Org was successfully updated.'
    end
    
    respond_with @org
  end

  def destroy
    @org = Org.find(params[:id])
    @org.destroy
    
    respond_with @org
  end
end
