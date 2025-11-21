require "application_system_test_case"

class SongVersionsTest < ApplicationSystemTestCase
  setup do
    @song_version = song_versions(:one)
  end

  test "visiting the index" do
    visit song_versions_url
    assert_selector "h1", text: "Song Versions"
  end

  test "creating a Song version" do
    visit song_versions_url
    click_on "New Song Version"

    fill_in "Comments", with: @song_version.comments_id
    fill_in "Date", with: @song_version.date
    fill_in "Description", with: @song_version.description
    fill_in "Slug", with: @song_version.slug
    fill_in "Song name", with: @song_version.song_name
    fill_in "User who posted", with: @song_version.user_who_posted_id
    fill_in "Venue location", with: @song_version.venue_location
    fill_in "Venue name", with: @song_version.venue_name
    fill_in "Vote count", with: @song_version.vote_count
    fill_in "Voted by", with: @song_version.voted_by_id
    click_on "Create Song version"

    assert_text "Song version was successfully created"
    click_on "Back"
  end

  test "updating a Song version" do
    visit song_versions_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @song_version.comments_id
    fill_in "Date", with: @song_version.date
    fill_in "Description", with: @song_version.description
    fill_in "Slug", with: @song_version.slug
    fill_in "Song name", with: @song_version.song_name
    fill_in "User who posted", with: @song_version.user_who_posted_id
    fill_in "Venue location", with: @song_version.venue_location
    fill_in "Venue name", with: @song_version.venue_name
    fill_in "Vote count", with: @song_version.vote_count
    fill_in "Voted by", with: @song_version.voted_by_id
    click_on "Update Song version"

    assert_text "Song version was successfully updated"
    click_on "Back"
  end

  test "destroying a Song version" do
    visit song_versions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Song version was successfully destroyed"
  end
end
