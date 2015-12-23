class ActiveRecord::Base
  def self.has_dollar_field(field_name)
    define_method "#{field_name}_in_dollars".to_sym do
      self[field_name.to_sym].to_dollars
    end

    define_method "#{field_name}_in_dollars=".to_sym do |dollars|
      self[field_name.to_sym] = dollars.presence.try(:gsub, /[^-\d\.]/, "").to_cents
    end
  end
end

class Fixnum
  def to_dollars
    (self / BigDecimal('100')).to_s.ljust(self.to_s.size + 1, '0')
  end
  def to_cents
    self * 100
  end
end

class Float
  def to_cents
    (self * 100).to_i
  end
  def to_dollars
    self.to_i.to_dollars
  end
end

class BigDecimal
  def to_cents
    (self * 100).to_i
  end
  def to_dollars
    self.to_i.to_dollars
  end
end

class Bignum
  def to_cents
    (self / BigDecimal('100')).to_s.ljust(self.to_s.size + 1, '0')
  end
  def to_dollars
    self * 100
  end
end

class String
  def to_cents
    BigDecimal.new(self).to_cents
  end
  def to_dollars
    self.to_i.to_dollars
  end
end

class NilClass
  def to_cents
    nil
  end
  def to_dollars
    nil
  end
end
