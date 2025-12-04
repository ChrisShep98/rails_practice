class SongVersionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :random]
  before_action :set_song_version, only: %i[show edit update destroy]

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
  def edit; end

  def dates_for_song
    slug = params[:slug]

    response = HTTParty.get("https://phish.in/api/v1/songs/#{slug}.json",
                            headers: {
                              'Authorization': "Bearer #{ENV['PHISH_KEY']}",
                              'Content-Type': 'application/json'
                            })
    performances = response.parsed_response['data']['tracks']

    date_options = performances.map do |shows|
      [{
        display: "#{shows['show_date']} - #{shows['venue_name']} #{shows['venue_location']}",
        date: shows['show_date'],
        venue_name: shows['venue_name'],
        venue_location: shows['venue_location']
      }]
    end
    render json: date_options
  end

  # POST /song_versions or /song_versions.json
  def create
    @song_version = SongVersion.new(song_version_params)
    @song_version.user = current_user

    respond_to do |format|
      if @song_version.save
        format.html { redirect_to @song_version, notice: 'Song version was successfully created.' }
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
        format.html { redirect_to @song_version, notice: 'Song version was successfully updated.' }
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
      format.html do
        redirect_to song_versions_path, status: :see_other, notice: 'Song version was successfully destroyed.'
      end
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
    params.require(:song_version).permit(:song_name, :date, :venue_name, :venue_location, :description)
  end
end
