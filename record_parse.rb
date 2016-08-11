require_relative 'artist'

class FileParser

  attr_reader :file_entries

  def initialize
    @file_entries = []
  end

  def read_names_from_file(filename)
    File.foreach(filename) do |row|
      file_entries << row
    end
    file_entries
  end

end