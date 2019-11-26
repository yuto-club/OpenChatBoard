require 'rails_helper'

describe 'ShowPage', js: true do
  specify 'ShowPage' do
    visit '/recruitments'
    click_on 'test012'

    visit '/recruitments/34'
    page.page_save_screenshot("ShowPage-#{DateTime.now}.png")
    expect(page).to have_css('p',text: 'test012')
  end
end
