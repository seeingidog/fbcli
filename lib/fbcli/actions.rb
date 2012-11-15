require 'koala'

module FBCLI
  class Actions
    
    def self.api_object
      config_file = File.expand_path("~/.fbcli.yml", File.dirname(__FILE__))
      if File.exists?(config_file)
        oauth_access_token = YAML.load_file(config_file)['oauth_access_token']
        @graph = Koala::Facebook::API.new(oauth_access_token)
      else
        raise "Use fbcli configure          to configure this application"
      end
    end

    def self.me
      api_object.get_connections("me", "")
    end

    FBCLI::GLOBAL_ACTIONS.each do |action|      
      self.class.send(:define_method, action.to_sym) do |args|
        api_object.get_connections("", args.first)
      end
    end
    
    FBCLI::ME_ACTIONS.each do |me_action|
      self.class.send(:define_method, ('my_' + me_action).to_sym) do
        api_object.get_connections("me", me_action)
      end
    end
    
  end
end