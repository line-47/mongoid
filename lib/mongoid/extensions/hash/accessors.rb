# encoding: utf-8
module Mongoid #:nodoc:
  module Extensions #:nodoc:
    module Hash #:nodoc:
      module Accessors #:nodoc:
        def insert(key, attrs)
          if key.singular?
            self[key] = attrs unless self[key]
            self[key] = self[key].merge(attrs) if self[key]
          else
            if elements = self[key]
              elements.update(attrs)
            else
              self[key] = [attrs]
            end
          end
        end
      end
    end
  end
end
