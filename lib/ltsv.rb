# -*- encoding: utf-8 -*-

class Ltsv
  def initialize
    @hash = {}
  end

  def dump
    lines = []
    @hash.each do |key, val|
      lines << "#{key}:#{val}"
    end
    lines.join("\t") + "\n"
  end

  def set(key, val)
    raise "key is required" if key.nil? || key.empty?
    raise "val is required" if val.nil?

    old_val = @hash.delete(key)
    @hash[key] = val
    old_val
  end

  def get(key)
    @hash[key]
  end

end
