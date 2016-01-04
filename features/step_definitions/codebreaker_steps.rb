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
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  out.messages.should include(message)
end
