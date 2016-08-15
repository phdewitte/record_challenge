require_relative '../record_parser'

describe RecordParser do
  context "#read_names_from_file" do
    it "returns the array of entries from the file" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt")).to be_an Array
    end

    it "creates an entry from each row of the file" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt").length).to be 5
    end

    it "maintains the initial order of records from the file (first position)" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt").first.last_name).to eq "Waits"
    end

    it "maintains the initial order of records from the file (last position)" do
      expect(RecordParser.read_names_from_file("fixtures/artists.txt").last.last_name).to eq "Wilkenfeld"
    end
  end

end