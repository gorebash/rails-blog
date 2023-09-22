require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = Category.new(name: 'category 1')
  end

  test 'verifies new categories' do
    assert @category.valid?
  end

  test 'name must be less than 25' do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test 'name must be longer than 2' do
    @category.name = 'aa'
    assert_not @category.valid?
  end

  test 'name must be unique' do
    @category.save
    @category2 = Category.new name: 'category 1'
    assert_not @category2.valid?
  end
end
