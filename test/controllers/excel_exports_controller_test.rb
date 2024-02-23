require "test_helper"

class ExcelExportsControllerTest < ActionDispatch::IntegrationTest
  test "should get export_data" do
    get excel_exports_export_data_url
    assert_response :success
  end
end
