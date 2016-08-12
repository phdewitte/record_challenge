require_relative 'artist'

module RecordParser

  def self.read_names_from_file(filename)
    artist_entries = []
    File.foreach(filename) do |row|
      artist_entries << row
    end
    artist_entries
  end

end