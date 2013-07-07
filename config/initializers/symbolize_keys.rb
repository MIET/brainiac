class Hash
  def symbolize_keys!
    keys.each do |key|
      if self[key].is_a? Array
        self[key].each{|value| value.symbolize_keys! if value.is_a? Hash}
      elsif self[key].is_a? Hash
        self[key].symbolize_keys!
      end
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end
end

class Array
  def symbolize_keys!
    self.each do |element|
      if element.is_a?(Array) || element.is_a?(Hash)
        element.symbolize_keys!
      end
    end
  end
end

module VK
  module Core
    def vk_call_with_symbolize(method_name, params)
      vk_call_without_symbolize(method_name, params).symbolize_keys
    end

    alias_method_chain :vk_call, :symbolize
  end
end

module ActiveSupport
  class HashWithIndifferentAccess
    def symbolize_keys!
      keys.each do |key|
        if self[key].is_a? Array
          self[key].each{|value| value.symbolize_keys! if value.is_a? Hash}
        elsif self[key].is_a? Hash
          self[key].symbolize_keys!
        end
        self[(key.to_sym rescue key) || key] = delete(key)
      end
      self
    end
  end
end