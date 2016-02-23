RSpec.describe Talk do
  #
  # validations
  #
  it { is_expected.to validate_presence_of(:event_id) }
  it { is_expected.to coerce_attribute(:event_id).to(String) }

  it { is_expected.to validate_presence_of(:author_id) }
  it { is_expected.to coerce_attribute(:author_id).to(String) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to coerce_attribute(:name).to(String) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to coerce_attribute(:description).to(String) }

  it { is_expected.to coerce_attribute(:created_at).to(DateTime) }

  it { is_expected.to coerce_attribute(:updated_at).to(DateTime) }
end
