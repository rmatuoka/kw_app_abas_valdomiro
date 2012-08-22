require 'test_helper'

class SitecontactTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sitecontact.new.valid?
  end
end
