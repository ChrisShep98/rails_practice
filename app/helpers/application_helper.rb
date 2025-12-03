module ApplicationHelper
  def song_options
    SONGS.map { |s| [s[:song], s[:slug]] }
  end
end
