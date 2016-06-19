feature "User adds player to game" do
  scenario "successfully" do
    visit root_path

    fill_in "Name", with: "Bingo"
    click_on "Submit"

    click_on "Add a Player"
    fill_in "Name", with: "Jake the Dog"
    click_on "Submit"

    expect(page).to have_css '.players li', text: "Jake the Dog"
  end
end
