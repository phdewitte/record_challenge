# Step 1 - Build a system to parse and sort a set of records

# A record consists of the following 5 fields: last name, first name, gender, date of birth and favorite color. The input comes in two formats:

# The pipe-delimited file lists each record as follows:
# LastName | FirstName | Gender | FavoriteColor | DateOfBirth

# The comma-delimited file looks like this:
# LastName, FirstName, Gender, FavoriteColor, DateOfBirth


require 'csv'

class CSVParser

  attr_reader :csv_entries

  def initialize
    @csv_entries = []
  end

  def read_csv(file)
    CSV.foreach(file) do |csv_row|
      csv_entries << csv_row
    end
  end

end