module LegacyMapper
  def self.included(base)
    base.class_eval do

      def self.legacy_mapper(array)
        array.each do |field,original|
          class_eval %{
             def #{field}
               #{original}
             end
             def #{field}=(v)
               self.#{original}=v
             end
          }
        end
      end

    end # base.class_eval do
  end # self.included(base)
end # module LegacyMapper
