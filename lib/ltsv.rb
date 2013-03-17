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

  alias :[]  :get
  alias :[]= :set

  def self.parse(dump_str)
    ltsv = Ltsv.new
    dump_str.each_line("\t") do |line|
      patterns = line.chomp.chomp("\t").scan(/(.+):(.+)/)
      ltsv.set(patterns.first[0], patterns.first[1])
    end
    ltsv
  end

end
