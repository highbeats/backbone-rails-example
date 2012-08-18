require 'spec_helper'

describe Brand do
  it { should belong_to(:company) }
  it { should have_many(:campaigns) }
end
