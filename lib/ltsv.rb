class Ltsv
  def initialize
    @hash = {}
  end

  def dump
    meta_chars = [
        {before: "\t", after: "\\t"},
        {before: "\n", after: "\\n"},
        {before: "\:", after: "\\:"},
    ]
    lines = []
    @hash.each do |key, val|
      meta_chars.each do |meta|
        val = val.gsub(meta[:before], meta[:after])
      end
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
