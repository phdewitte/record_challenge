require_relative '../artist_collection'

describe ArtistCollection do
  let(:hank) { Artist.new(first_name: "Hank", last_name: "Williams", gender: "Male", fav_color: "Brown", birthdate: "1923-09-17") }
  let(:annie) { Artist.new(first_name: "Annie", last_name: "Clark", gender: "Female", fav_color: "Blue", birthdate: "1982-09-28") }
  let(:django) { Artist.new(first_name: "Django", last_name: "Reinhardt", gender: "Male", fav_color: "Black", birthdate: "1910-01-23") }
  let(:sarah) { Artist.new(first_name: "Sara", last_name: "Vaughan", gender: "Female", fav_color: "Purple", birthdate: "1924-03-17") }
  let(:empty_collection) { ArtistCollection.new}
  let(:collection) { ArtistCollection.new([hank, annie, django, sarah]) }

  context "#initialize" do
    it "initializes a new instance with an array of artists" do
      expect(empty_collection.artists).to be_an Array
    end

    it "can be initialized without artists" do
      expect(empty_collection.artists.empty?).to be true
    end

    it "can be initialized with artist objects" do
      expect(collection.artists.size).to eq 4
    end
  end

  context "#sort_by_gender" do
    it "sorts the artists in the collection by gender beginning with females" do
      expect(collection.sort_by_gender.first).to be annie
    end

    it "sorts the artists in the collection by last names next" do
      expect(collection.sort_by_gender.last).to be hank
    end
  end

  context "#sort_by_birthdate" do
    it "sorts artists in the collection by their birthdates" do
      expect(collection.sort_by_birthdate.first).to be django
    end
  end

  context "#sort_by_last_name" do
    it "sorts artists in the collection by their last names (first position)" do
      expect(collection.sort_by_last_name.last).to be annie
    end

    it "sorts artists in the collection by their last names (last position)" do
      expect(collection.sort_by_last_name.first).to be hank
    end
  end

end