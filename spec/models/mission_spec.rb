require 'rails_helper'

RSpec.describe Mission do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:started_at) }
  it { is_expected.to validate_presence_of(:finished_at) }
  it { is_expected.to belong_to(:user) }
end
