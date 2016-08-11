require_relative 'artist'

class ArtistCollection
  include RecordParser

  def initialize(artists = [])
    @artists = artists
  end


end