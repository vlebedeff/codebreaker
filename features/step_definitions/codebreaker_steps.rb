class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def out
  @output ||= Output.new
end

Given /^I am not yet playing$/ do
end

Given /^I start a new game$/ do
  game = Codebreaker::Game.new(out)
  game.start('1234')
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(out.messages).to include(message)
end

Given /^the secret code is "([^"]*)"$/ do |secret|
  @game = Codebreaker::Game.new(out)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  expect(out.messages).to include(mark)
end
