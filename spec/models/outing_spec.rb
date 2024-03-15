require "rails_helper"

RSpec.describe Outing, type: :model do
  describe "relationships" do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  describe "validations" do 
    it { validate_presence_of :event }
    it { validate_presence_of :location }
    it { validate_presence_of :date }
  end
end
