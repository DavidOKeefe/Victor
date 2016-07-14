feature "User starts game" do
  scenario "succesfully" do
   visit root_path

    fill_in "Name", with: "Bingo"
    click_on "Submit"

    click_on "Add a Player"
    fill_in "Name", with: "Jake the Dog"
    click_on "Submit"

    click_on "Add a Player"
    fill_in "Name", with: "Finn the Hero"
    click_on "Submit"

    click_on "Start Game"

    expect(page).to have_css '.scores li', text: "0"
  end
end
