class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  STATUS_PER_PAGE = 5
  

  # GET /profiles
  # GET /profiles.json
  def index
    
   
   @user = User.all.where('id = ?',current_user.id)
   @recentforum = Forum.all.where('user_id = ?', current_user.id).order('created_at DESC')
   #@profiles = Profile.all.where('user_id = ?', current_user.id).order('created_at DESC')
   @profile = Profile.new

   #pagination
   @totalstatus = Profile.count
   @limitPages = @totalstatus / STATUS_PER_PAGE
   @page = params.fetch(:page,0).to_i
   @profiles = Profile.all.where('user_id = ?', current_user.id).order('created_at DESC').offset(@page * STATUS_PER_PAGE).limit(STATUS_PER_PAGE)
     
    
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
   #@user = current_user
   @user = User.find(params[:id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    
    #@profile.isowner = @user.id 

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: 'Successfully updated status.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dislike

    @profile = Profile.find_by(id: params[:id])
    @profile.update_attribute(:dislikes, @profile.dislikes+1)
    redirect_to profile_path(@profile.id)
     
  end
  
  def like
    
    @profile = Profile.find_by(id: params[:id])
    @profile.update_attribute(:likes, @profile.likes+1)
     redirect_to profile_path(@profile.id) 
    
         
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def set_member
      @member = User.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:status, :about, :user_id, :isowner)
    end

    
end
