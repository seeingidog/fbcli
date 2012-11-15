module FBCLI
  class Configure
    def initialize
      oauth_access_token = ask("Oauth Access Token (Copy here: https://developers.facebook.com/tools/explorer): ")
      `echo "oauth_access_token: #{oauth_access_token}" > ~/.fbcli.yml`
      puts "Configured ~/.fbcli.yml"
    end
    
  end
end
