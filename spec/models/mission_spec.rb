require 'rails_helper'

RSpec.describe Mission do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:start_at) }
  it { is_expected.to validate_presence_of(:finish_at) }
end
