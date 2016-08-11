require_relative 'artist'

describe Artist do
  let(:artist) { Artist.new(first_name: "Hank", last_name: "Williams", gender: "Male", fav_color: "Brown", birthdate: "1923-09-17") }

  context "#initialize" do
    it "assigns the artist a first name" do
      expect(artist.first_name).to eq "Hank"
    end

    it "assigns the artist a last name" do
      expect(artist.last_name).to eq "Williams"
    end

    it "assigns the artist a gender" do
      expect(artist.gender).to eq "Male"
    end

    it "assigns the artist a favorite color" do
      expect(artist.fav_color).to eq "Brown"
    end

    it "assigns the artist a birthdate" do
      expect(artist.birthdate).to eq "1923-09-17"
    end
  end

  context "#formatted_bday" do
    it "displays the artist's birthdate in a proper format" do
      expect(artist.formatted_bday).to eq "17 September, 1923"
    end
  end

  context "#display_info" do
    it "displays all the artist's information in a readable format" do
      expect(artist.display_info).to eq "Name: Hank Williams Gender: Male Favorite Color: Brown Birthdate: 17 September, 1923"
    end
  end

end