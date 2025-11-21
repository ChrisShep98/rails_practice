class SongVersionsController < ApplicationController
  before_action :set_song_version, only: %i[ show edit update destroy ]

  # GET /song_versions or /song_versions.json
  def index
    @song_versions = SongVersion.all
  end

  # GET /song_versions/1 or /song_versions/1.json
  def show

    slug = params[:slug]
    @song_versions = SONGS.find { |song| song[:slug] == slug }
  end

  # GET /song_versions/new
  def new
    @song_version = SongVersion.new
  end

  # GET /song_versions/1/edit
  def edit
  end

  # POST /song_versions or /song_versions.json
  def create
    @song_version = SongVersion.new(song_version_params)

    respond_to do |format|
      if @song_version.save
        format.html { redirect_to @song_version, notice: "Song version was successfully created." }
        format.json { render :show, status: :created, location: @song_version }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_versions/1 or /song_versions/1.json
  def update
    respond_to do |format|
      if @song_version.update(song_version_params)
        format.html { redirect_to @song_version, notice: "Song version was successfully updated." }
        format.json { render :show, status: :ok, location: @song_version }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_versions/1 or /song_versions/1.json
  def destroy
    @song_version.destroy

    respond_to do |format|
      format.html { redirect_to song_versions_path, status: :see_other, notice: "Song version was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def random
    random_song = SONGS.sample
    redirect_to song_path(slug: random_song[:slug])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_version
      @song_version = SongVersion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_version_params
      params.require(:song_version).permit(:song_name, :date, :venue_name, :venue_location, :vote_count, :voted_by_id, :comments_id, :user_who_posted_id, :description, :slug)
    end
end
