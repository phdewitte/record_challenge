require_relative 'artist'

describe Artist do
  let(:artist) { Artist.new(first_name: "Hank", last_name: "Williams", gender: "male", fav_color: "brown", birthdate: "1923-17-09") }

  context "#initialize" do
    it "assigns the artist a first name" do
      expect(artist.first_name).to eq "Hank"
    end

    it "assigns the artist a last name" do
      expect(artist.last_name).to eq "Williams"
    end

    it "assigns the artist a gender" do
      expect(artist.gender).to eq "male"
    end

    it "assigns the artist a favorite color" do
      expect(artist.fav_color).to eq "brown"
    end

    it "assigns the artist a birthdate" do
      expect(artist.birthdate).to eq "1923-17-09"
    end
  end

end