require_relative '../record_parser'

describe RecordParser do
  let(:artist) { Artist.new(first_name: "Hank", last_name: "Williams", gender: "Male", fav_color: "Brown", birthdate: "1923-09-17") }

  context "#read_names_from_file" do
    it "returns the array of entries from the file" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt")).to be_an Array
    end

    it "creates an entry from each row of the file" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt").length).to be 5
    end

    it "maintains the initial order of records from the file (first position)" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt").first).to include "Waits, Tom"
    end

    it "maintains the initial order of records from the file (last position)" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt").last).to include "Wilkenfeld | Tal"
    end
  end

end