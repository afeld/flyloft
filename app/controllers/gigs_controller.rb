class GigsController < ApplicationController
  # GET /gigs
  # GET /gigs.xml
  def index
    @gigs = Gig.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gigs }
    end
  end

  # GET /gigs/1
  # GET /gigs/1.xml
  def show
    @gig = Gig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gig }
    end
  end

  # GET /gigs/new
  # GET /gigs/new.xml
  def new
    @gig = Gig.new
    if user_signed_in?
      @gig.contact_first_name ||= current_user.first_name
      @gig.contact_last_name ||= current_user.last_name
      @gig.contact_email ||= current_user.email
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gig }
    end
  end

  # GET /gigs/1/edit
  def edit
    @gig = Gig.find(params[:id])
  end

  # POST /gigs
  # POST /gigs.xml
  def create
    @gig = Gig.new(params[:gig])
    @gig.creator ||= current_user

    respond_to do |format|
      if @gig.save
        format.html { redirect_to(@gig, :notice => 'Gig was successfully created.') }
        format.xml  { render :xml => @gig, :status => :created, :location => @gig }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gigs/1
  # PUT /gigs/1.xml
  def update
    @gig = Gig.find(params[:id])

    respond_to do |format|
      if @gig.update_attributes(params[:gig])
        format.html { redirect_to(@gig, :notice => 'Gig was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gigs/1
  # DELETE /gigs/1.xml
  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy

    respond_to do |format|
      format.html { redirect_to(gigs_url) }
      format.xml  { head :ok }
    end
  end
end
