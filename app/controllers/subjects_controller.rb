class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :browseforums]

   FORUMS_PER_PAGE = 5

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
    @forums = Forum.all.order('created_at desc')

    
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @forums = Forum.where('subject_id = ?', @subject.id)
    @subjects = Subject.all
    
    @totalforums = @forums.count
    @limitPages = @totalforums / FORUMS_PER_PAGE
    @page = params.fetch(:page,0).to_i
    @forums = @forums.offset(@page * FORUMS_PER_PAGE).limit(FORUMS_PER_PAGE)
    @forumscount = @forums.all
    
  end

  def browseforums
     @subject = Subject.all
     @subjects = Subject.all
     @forums = Forum.all
     #current_user.update_attribute :admin, true
     #@forumscount = @forums.where('subject_id = ?', @subject.id).count
  
    
    
    
     
  
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_path, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:subject, :forum_id, :channel_id)
    end
end
