require_relative 'artist'

module RecordParser

  def self.read_names_from_file(filename)
    file_entries = []
    File.foreach(filename) do |row|
      file_entries << row
    end
    file_entries
  end

end