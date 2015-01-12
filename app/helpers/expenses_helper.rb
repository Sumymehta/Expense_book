module ExpensesHelper
   def datepicker_input(method, options = {})
      format = options[:format] || ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] || '%d %b %Y'
      string_input(method, datepicker_options(format, object.send(method)).merge(options))
    end

end
