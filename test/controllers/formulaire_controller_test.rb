require 'test_helper'

class FormulaireControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_index_url
    assert_response :success
  end

end
