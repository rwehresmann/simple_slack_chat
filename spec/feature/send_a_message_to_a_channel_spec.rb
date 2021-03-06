require 'rails_helper'

describe "Send a message to a channel", type: :feature, js: true do
  it "shows messages sended in channel" do
    user = create(:user)
    team = create(:team, users: [user])
    message_text = "Test message"

    login_as user
    visit team_chat_path(team.slug)
    fill_in "new_message", with: message_text
    find("#new_message").native.send_keys :enter

    expect(page).to have_selector(".message")
    expect(page).to have_content(message_text)
  end
end
