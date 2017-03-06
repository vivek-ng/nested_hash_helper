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

  def test_deep_delete_empty_two_level_nested
  	a = {:gh => {:jj => {:kk => "bbbb" ,:pp => ""} , :ui => ""} , :puso => "opopo"}
  	b = {:gh => {:jj => {:kk => "bbbb" }} , :puso => "opopo"}
  	assert_equal a.deep_delete_empty , b
  end

  def test_depth_for_one_level_nested
  	a = {:gh => {:jj => "nbnbn" , :oo => "popo"} , :jj => "erere"}
  	assert_equal a.find_depth , 2
  end

  def test_deep_keys_for_one_level_nested
  	a = {:gh => {:jj => "bnbn"} ,:kk => "pop"}
  	b = [:gh , :jj]
  	assert_equal a.find_deep_keys("bnbn") , b
  end

  def test_deep_keys_for_two_level_nested
  	a = {:gh => {:jj => {:pop => "bbb" , :olo => "ooooo"}} , :pp => "ooooo"}
  	b = [:gh , :jj , :olo]
  	assert_equal a.find_deep_keys("ooooo") , b
  end
  
  def test_deep_intersect_for_one_level_nested
  	a = {:gh => {:pp => "vivek" , :ol => "lol"} , :il => {:fg => "nn"}}
  	b = {:gh => {:pp => "lll" , :ol => "lol"}}
  	c = {:gh => {:ol => "lol"}}
  	assert_equal a.find_deep_intersection(b) , c
  end
  
  def test_deep_intersect_two_level_nested
    a = {:gh => {:pp => {:sd => "lat" , :iko => "wer"} , :ol => "lol"} , :il => {:fg => "nn"}}
    b = {:gh => {:pp => {:sd => "lat" , :iko => ""} , :ol => "lol"} , :il => {:fg => "nn"}}
    c = {:gh => {:pp => {:sd => "lat"} , :ol => "lol"} , :il => {:fg => "nn"}}
    assert_equal a.find_deep_intersection(b) , c
  end


end
