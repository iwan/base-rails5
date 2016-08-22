require 'yandex-translator'  # https://github.com/aegorov/yandex-translator

class LocalesGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  @@t = Yandex::Translator.new(ENV['YANDEX_API_KEY']) # @translator.translate word, from: :en, to: 'en'

  def generate_locale_files
    excluded_attrib = ["id", "created_at", "updated_at", "creator_id", "updater_id"]
    @attributes = Kernel.const_get(class_name).send(:attribute_names)-excluded_attrib

    locales = I18n.available_locales

    @t = Yandex::Translator.new(ENV['YANDEX_API_KEY']) # @translator.translate word, from: :en, to: 'en'

    def @t.localize(text, dest_lang=I18n.default_locale)
      return text.humanize if dest_lang==I18n.default_locale
      begin
        translate(text, from: I18n.default_locale, to: dest_lang).humanize
      rescue Exception => e
        text.humanize
      end
    end

    locales.each do |locale|
      @l = locale
      template "yaml_file.rb", "config/locales/#{plural_name}/#{locale}.yml"
    end
  end
end
