require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }

    it { should validate_length_of(:password).is_at_least(6) }
  end
end
