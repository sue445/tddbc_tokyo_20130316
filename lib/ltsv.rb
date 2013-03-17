# -*- encoding: utf-8 -*-

class Ltsv
  def initialize
    @hash = {}
  end

  def dump
    "\n"
  end

  def set(key, val)
    @hash[key] = val
    nil
  end

end
