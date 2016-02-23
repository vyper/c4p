RSpec.describe Authentication do
  #
  # validations
  #
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to coerce_attribute(:user_id).to(String) }

  it { is_expected.to validate_presence_of(:provider) }
  it { is_expected.to coerce_attribute(:provider).to(String) }

  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to coerce_attribute(:uid).to(String) }

  it { is_expected.to coerce_attribute(:created_at).to(DateTime) }

  it { is_expected.to coerce_attribute(:updated_at).to(DateTime) }
end
