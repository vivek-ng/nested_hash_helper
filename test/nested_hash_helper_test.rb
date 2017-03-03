require './test/test_helper'

class NestedHashHelperTest < Minitest::Unit::TestCase

  def test_that_it_has_a_version_number
    refute_nil ::NestedHashHelper::VERSION
  end

  def test_deep_except_for_normal_hash
    a = {:gh => "ghghg" ,:hj => "sjsjsj"}
    b = {:hj => "sjsjsj"}
    assert_equal a.deep_except(:gh) , b
  end

  def test_deep_except_for_one_level_nested
  	a = {:gh => {:jj => "nbnbn" , :oo => "popo"} , :jj => "erere"}
  	b = {:gh => {:oo => "popo"}}
  	assert_equal a.deep_except(:jj) , b
  end

end
