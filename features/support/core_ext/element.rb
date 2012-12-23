module PageObject
  module Elements
    class Element
      def print
        puts "#{"-" * 15}\n#{text}"
      end
    end
  end
end
