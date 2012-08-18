require 'spec_helper'

describe Campaign do
  it { should belong_to(:brand) }
end
