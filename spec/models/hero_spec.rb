require 'rails_helper'

RSpec.describe Hero, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "scopes" do
    it "returns all heroes sorted by name" do
      expect(Hero.sorted_by_name.to_sql).to eq Hero.order(:name).to_sql
    end
  end
end
