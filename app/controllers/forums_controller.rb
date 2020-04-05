class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_action :find_subjects, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  FORUMS_PER_PAGE = 5
  #SEARCH_PER_PAGE = 5

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all.order('created_at desc')
    @subjects = Subject.all.order('created_at desc')

    # pagination for all posts
    @totalforums = Forum.count
    @limitPages = @totalforums / FORUMS_PER_PAGE
    @page = params.fetch(:page,0).to_i
    @forums = Forum.all.order('created_at desc').offset(@page * FORUMS_PER_PAGE).limit(FORUMS_PER_PAGE)
    @forumscount = Forum.all
  
   
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
     @forums = Forum.all.order('created_at desc')
    @subjects = Subject.all.order('created_at desc')
   
  end

  # GET /forums/new
  def new
    @forum = current_user.forums.build
  end

  # GET /forums/1/edit
  def edit
  end

  def search
    
     st = "%#{params[:q]}%"
     @forums = Forum.where("title like ?", st).or(Forum.where("content like ?", st))
    

    # pagination for search
    @totalsearch = @forums.count
    #@limitPages = @totalsearch / SEARCH_PER_PAGE
    #@page = params.fetch(:page,0).to_i
    #@forums = Forum.where("title like ?", st).or(Forum.where("content like ?", st)).offset(@page * SEARCH_PER_PAGE).limit(SEARCH_PER_PAGE)
    @forumscount = @totalsearch
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = current_user.forums.build(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: 'Forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    def find_subjects
      @subjects = Subject.all.order('created_at desc')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:title, :content, :subject_id)
    end
end