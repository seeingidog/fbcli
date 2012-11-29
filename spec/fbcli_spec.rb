require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Fbcli" do
  
  before :each do
    mock_terminal
    @options = Commander::Command::Options.new
  end

  it "ensures all commands are available" do    
    Commander::Command.commands.keys.count.should be >= 31
  end
  
  it "displays help" do
    @command = command :help
    @command.run
  end
  
end
