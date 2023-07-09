class Specification
  def satisfied?
    "#{__method__} should be implemented by subclasses. #{self.class} is abstract and shouldn't be used directly"
  end
end
