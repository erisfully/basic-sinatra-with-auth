require "spec_helper"

describe UserDatabase do
  let(:user_database) { UserDatabase.new }

  describe "#insert" do
    it "returns the object if it succeeds" do
      user_as_hash = {:username => "jetaggart", :password => "password"}

      result = user_database.insert(user_as_hash)

      expect(result).to include({:username => "jetaggart", :password => "password"})
    end

    it "gives the user an id" do
      user_as_hash = {:username => "jetaggart", :password => "password"}

      user = user_database.insert(user_as_hash)

      expect(user[:id]).to eq(1)
    end

    it "offsets the id by how many users exist" do
      user_database.insert({:username => "jetaggart", :password => "some password"})
      second_user = user_database.insert(:username => "another_name", :password => "some other password")

      expect(second_user[:id]).to eq(2)
    end

    context "validations" do
      it "requires a username" do
        expect {
          user_database.insert(:password => "password")
        }.to raise_error(ArgumentError, "username required")
      end

      it "requires a password" do
        expect {
          user_database.insert(:username => "username")
        }.to raise_error(ArgumentError, "password required")
      end

      it "shows many validations" do
        expect {
          user_database.insert({})
        }.to raise_error(ArgumentError, "username, password required")
      end
    end
  end

  describe "#find" do
    it "finds the user by the id" do
      user_database.insert(:username => "jetaggart", :password => "password")
    end
  end
end
