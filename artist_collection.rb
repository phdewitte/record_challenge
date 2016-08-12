require_relative 'artist'

class ArtistCollection

  attr_reader :artists

  def initialize(artists = [])
    @artists = artists
  end

  def sort_by_gender
    @artists.sort_by { |artist| [artist.gender, artist.last_name] }
  end

  def sort_by_birthdate
    @artists.sort_by { |artist| artist.parsed_bday}
  end

end