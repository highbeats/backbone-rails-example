require 'spec_helper'

describe Company do
  it { should have_many(:brands) }
  it { should have_many(:campaigns).through(:brands) }
end
