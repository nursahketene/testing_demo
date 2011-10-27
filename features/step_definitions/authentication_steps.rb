#Login Scenario
Given /^The user "user@example.com" has an account$/ do
  #the user account is automatically populated in db before every run.
end

module LoginSteps
  def login
    visit('/users/sign_in')
    fill_in('user_email', :with => 'user@example.com')
    fill_in('user_password', :with => 'please')
    click_button('Sign in')
  end
end
World(LoginSteps)

When /^he logs in$/ do
  login()
end

Then /^he should see text "([^"]*)"$/ do |username|
  page.should have_content(username)
end

Then /^he should see a link "([^"]*)"$/ do |logout|
  page.should have_link(logout)
end

#Logout Scenario
Given /^I have logged in as any user$/ do
  login()
end

When /^I click "([^"]*)"$/ do |logout|
  visit('/users/sign_out')
end

Then /^I should see "([^"]*)"$/ do |not_logged_in|
  page.should have_content(not_logged_in)
  page.should have_content('Signed out successfully.')
end


