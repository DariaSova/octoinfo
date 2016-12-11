module OmniauthMacros
    def mock_auth_hash
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        "provider"=>"github",
        "uid"=>"10904444",
        "info"=>
        {"nickname"=>"Win",
         "email"=>"pooh@gmail.com",
         "name"=>"Winnie the Pooh",
         "image"=>"https://avatars.githubusercontent.com/u/12345",
         "urls"=>{"GitHub"=>"https://github.com/winniepooh", "Blog"=>nil}},
        "credentials"=>{"token"=>"5e61f3bjhg5jff5jh", "expires"=>false},
        "extra"=>
        {"raw_info"=>
         {"login"=>"WinniePooh",
          "id"=>111111,
          "avatar_url"=>"https://avatars.githubusercontent.com/u/12345",
          "gravatar_id"=>"",
          "url"=>"https://api.github.com/users/WinniePooh",
          "html_url"=>"https://github.com/WinniePooh",
          "followers_url"=>"https://api.github.com/users/WinniePooh/followers",
          "following_url"=>"https://api.github.com/users/WinniePooh/following{/other_user}",
          "gists_url"=>"https://api.github.com/users/WinniePooh/gists{/gist_id}",
          "starred_url"=>"https://api.github.com/users/WinniePooh/starred{/owner}{/repo}",
          "subscriptions_url"=>"https://api.github.com/users/WinniePooh/subscriptions",
          "organizations_url"=>"https://api.github.com/users/WinniePooh/orgs",
          "repos_url"=>"https://api.github.com/users/WinniePooh/repos",
          "events_url"=>"https://api.github.com/users/WinniePooh/events{/privacy}",
          "received_events_url"=>"https://api.github.com/users/WinniePooh/received_events",
          "type"=>"User",
          "site_admin"=>false,
          "name"=>"Winnie The Pooh",
          "company"=>"@disney",
          "blog"=>nil,
          "location"=>"nil",
          "email"=>"pooh@gmail.com",
          "hireable"=>nil,
          "bio"=>"Cartoon Character",
          "public_repos"=>15,
          "public_gists"=>0,
          "followers"=>123000,
          "following"=>0,
          "created_at"=>"2015-02-08T03:45:01Z",
          "updated_at"=>"2016-11-30T03:45:56Z"
         }
        }
      })
    end
end
