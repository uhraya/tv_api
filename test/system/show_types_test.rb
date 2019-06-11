require "application_system_test_case"

class ShowTypesTest < ApplicationSystemTestCase
  setup do
    @show_type = show_types(:one)
  end

  test "visiting the index" do
    visit show_types_url
    assert_selector "h1", text: "Show Types"
  end

  test "creating a Show type" do
    visit show_types_url
    click_on "New Show Type"

    fill_in "Name", with: @show_type.name
    click_on "Create Show type"

    assert_text "Show type was successfully created"
    click_on "Back"
  end

  test "updating a Show type" do
    visit show_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @show_type.name
    click_on "Update Show type"

    assert_text "Show type was successfully updated"
    click_on "Back"
  end

  test "destroying a Show type" do
    visit show_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Show type was successfully destroyed"
  end
end
