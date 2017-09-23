
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pv3
    class Application < Rails::Application
        # Initialize configuration defaults for originally generated Rails version.
        config.load_defaults 5.1

        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration should go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded.

        # autoload
        config.enable_dependency_loading = true
        config.autoload_paths << Rails.root.join('lib')

        # アクティブレコード拡張
        config.autoload_paths += %W(
        #{config.root}/lib
        )

        # 日本語化
        config.i18n.default_locale = :ja

        # validateエラー表示の修正 labelの場合はスキップ
        config.action_view.field_error_proc = Proc.new do |html_tag, instance|
            if instance.kind_of?(ActionView::Helpers::Tags::Label)
                # skip when label
                html_tag.html_safe
            else
                "<div class=\"has-danger\">#{html_tag}<span class=\"form-control-feedback small\">#{instance.error_message.first}</span></div>".html_safe
            end
        end

    end
end


