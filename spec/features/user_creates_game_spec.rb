feature "User creates game" do
  scenario "successfully" do
    visit root_path

    fill_in "Name", with: "Bingo"
    click_on "Submit"

    expect(page).to have_css 'h1', text: "Bingo"
  end
end
