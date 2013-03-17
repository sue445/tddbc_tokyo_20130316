# -*- encoding: utf-8 -*-

class Ltsv
  def initialize
    @hash = {}
  end

  def dump
    "\n"
  end

  def set(key, val)
    old_val = @hash[key]
    @hash[key] = val
    old_val
  end

  def get(key)
    @hash[key]
  end

end
