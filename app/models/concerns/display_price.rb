module DisplayPrice
  extend ActiveSupport::Concern

  class_methods do
    def price_methods(*methods, precision: 2)
      methods.each do |price_method|
        define_method("display_#{price_method}") do
          price = public_send(price_method)
          return '' if price.nil?
          return format(format('%%.%if', precision), price.round(precision)) if price < 10_0000
          return format(format('%%.2f 万'), price.fdiv(1_0000).round(2))
        end
      end
    end

    def discount_percentage_methods(*methods)
      methods.each do |discount_percentage_method|
        define_method("non_#{discount_percentage_method}") do
          100 - public_send(discount_percentage_method)
        end

        define_method("display_non_#{discount_percentage_method}") do
          v = public_send("non_#{discount_percentage_method}")
          v.%(10).zero? ? format('%d', v.div(10)) : format('%.1f', v.fdiv(10))
        end

        define_method("#{discount_percentage_method}_in_words") do
          format('%s折', public_send("display_non_#{discount_percentage_method}"))
        end
      end
    end
  end
end
