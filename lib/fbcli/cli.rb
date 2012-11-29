include FBCLI::Formatters

program :version, '1.0.1'
program :description, 'Facebook CLI Tool. Navigates the Social Graph.'
program :help, 'Author', 'Ian Morgan <ian@ruby-code.com>'

global_option('--json') { $json = true }
default_command :welcome

command :welcome do |c|
  c.syntax = 'welcome'
  c.description = "Welcomes user to application"
  c.action do |arg|
    puts "Commands to get started: configure, help"
  end
end

command :configure do |c|
  c.syntax = 'configure'
  c.description = "Configures Oauth Key."
  c.action do |arg|
    FBCLI::Configure.new
  end
end

command :me do |c|
  c.syntax = 'me'
  c.description = "Displays my current object."
  c.action do
    data FBCLI::Actions.me
  end
end

FBCLI::GLOBAL_ACTIONS.each do |action|
  command action.to_sym do |c|
    c.syntax = action + " <user or page id>"
    c.description = "Displays a user or pages's #{action}."
    c.action do |arg|
      eval("data FBCLI::Actions.#{action}(#{arg})")
    end
  end
end

FBCLI::ME_ACTIONS.each do |me_action|
  command ('my_' + me_action).to_sym do |c|
    c.syntax = "my_" + me_action
    c.description = "Displays my #{me_action}."
    c.action do |arg|
      eval("data FBCLI::Actions.my_#{me_action}")
    end
  end
end

