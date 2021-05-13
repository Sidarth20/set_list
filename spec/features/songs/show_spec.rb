require 'rails_helper'
RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357, artist_id: artist.id)
    visit "/songs"
    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
    expect(page).to have_content(song1.play_count)
    expect(page).to have_content(song2.play_count)
    expect(page).to_not have_content(song2.title)
  end
  it 'displays the name of the artist for the song' do
    artist = Artist.create(name: 'Carly Rae Jepsen')
    song1 = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456357)
    visit "/songs"
    click_on('songs page')
    save_and_open_page
    expect(page).to have_content(artist.name)
  end
end
