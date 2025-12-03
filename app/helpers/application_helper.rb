module ApplicationHelper
  def song_options_for_select
    SONGS.map do |s| 
      [s[:song], s[:song], { 'data-slug': s[:slug] } ]
    end
  end
end
