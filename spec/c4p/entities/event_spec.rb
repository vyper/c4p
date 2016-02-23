RSpec.describe Event do
  #
  # validations
  #
  it { is_expected.to validate_presence_of(:owner_id) }
  it { is_expected.to coerce_attribute(:owner_id).to(String) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to coerce_attribute(:name).to(String) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to coerce_attribute(:description).to(String) }

  it { is_expected.to coerce_attribute(:tags).to(Array) }

  it { is_expected.to coerce_attribute(:created_at).to(DateTime) }

  it { is_expected.to coerce_attribute(:updated_at).to(DateTime) }
end
