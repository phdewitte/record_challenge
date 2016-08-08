# Step 1 - Build a system to parse and sort a set of records

# A record consists of the following 5 fields: last name, first name, gender, date of birth and favorite color. The input comes in two formats:

# The pipe-delimited file lists each record as follows:
# LastName | FirstName | Gender | FavoriteColor | DateOfBirth

# The comma-delimited file looks like this:
# LastName, FirstName, Gender, FavoriteColor, DateOfBirth

class FileParser

  attr_reader :file_entries

  def initialize
    @file_entries = []
  end

  def read_file(filename)
    File.foreach(filename) do |row|
      file_entries << row
    end
  end

end