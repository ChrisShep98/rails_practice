require "test_helper"

class SongVersionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song_version = song_versions(:one)
  end

  test "should get index" do
    get song_versions_url
    assert_response :success
  end

  test "should get new" do
    get new_song_version_url
    assert_response :success
  end

  test "should create song_version" do
    assert_difference('SongVersion.count') do
      post song_versions_url, params: { song_version: { comments_id: @song_version.comments_id, date: @song_version.date, description: @song_version.description, slug: @song_version.slug, song_name: @song_version.song_name, user_who_posted_id: @song_version.user_who_posted_id, venue_location: @song_version.venue_location, venue_name: @song_version.venue_name, vote_count: @song_version.vote_count, voted_by_id: @song_version.voted_by_id } }
    end

    assert_redirected_to song_version_url(SongVersion.last)
  end

  test "should show song_version" do
    get song_version_url(@song_version)
    assert_response :success
  end

  test "should get edit" do
    get edit_song_version_url(@song_version)
    assert_response :success
  end

  test "should update song_version" do
    patch song_version_url(@song_version), params: { song_version: { comments_id: @song_version.comments_id, date: @song_version.date, description: @song_version.description, slug: @song_version.slug, song_name: @song_version.song_name, user_who_posted_id: @song_version.user_who_posted_id, venue_location: @song_version.venue_location, venue_name: @song_version.venue_name, vote_count: @song_version.vote_count, voted_by_id: @song_version.voted_by_id } }
    assert_redirected_to song_version_url(@song_version)
  end

  test "should destroy song_version" do
    assert_difference('SongVersion.count', -1) do
      delete song_version_url(@song_version)
    end

    assert_redirected_to song_versions_url
  end
end
