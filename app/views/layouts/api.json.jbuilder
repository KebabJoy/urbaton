# frozen_string_literal: true


json.key_format!(camelize: :lower) if controller.camelize_keys?

json.merge!(Oj.load(yield, mode: :compat))
