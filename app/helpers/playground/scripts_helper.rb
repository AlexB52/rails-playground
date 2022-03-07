module Playground
  module ScriptsHelper
    MAX_SELECT_BOX_SIZE = 15

    def script_size(scripts)
      [MAX_SELECT_BOX_SIZE, scripts.length + 1].min
    end

    def script_options(scripts)
      options = scripts
        .map { |path| [script_label(path), url(path)] }
        .unshift(["New script", new_script_path(format: :turbo_stream)])

      options_for_select options
    end

    private

    def script_label(path)
      Pathname(path)
        .basename
        .to_s
        .truncate(30)
    end

    def script_pathname
      Rails.root.join("lib").to_s
    end

    def url(path)
      script_scripts_path(name: path, format: :turbo_stream)
    end
  end
end
