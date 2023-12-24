require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TechlogApp
  class Application < Rails::Application  
    config.load_defaults 7.0

    config.generators do |g|
      g.assets false          # css,JavaScriptファイルを自動生成しない
      g.helper false          # helperファイルを自動生成しない
      g.test_framework :rspec,
        fixtures: false,      #テストDBにレコードを作るfixtureの作成をスキップ
        view_specs: false,    #ビューファイル用のスペックを作成しない
        helper_specs: false,  #ヘルパーファイル用のスペックを作成しない
        routing_specs: false  #ルート用のスペックファイルを作成しない
    end
  end
end
