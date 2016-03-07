RSpec.describe User do
  #
  # validations
  #
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to coerce_attribute(:name).to(String) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to coerce_attribute(:email).to(String) }
  it { is_expected.to allow_value('vyper@maneh.org').for(:email) }
  it { is_expected.to_not allow_value('vyper-at-maneh-dot-org').for(:email) }
  it { is_expected.to_not allow_value('vypermanehorg').for(:email) }

  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to coerce_attribute(:password).to(String) }

  it { is_expected.to coerce_attribute(:created_at).to(DateTime) }

  it { is_expected.to coerce_attribute(:updated_at).to(DateTime) }
end
