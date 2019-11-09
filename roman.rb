# frozen_string_literal: true

# class Integer
class Integer
  ROMAN = { M: 1000, CM: 900,
            D: 500,  CD: 400,
            C: 100,  XC: 90,
            L: 50,   XL: 40,
            X: 10,   IX: 9,
            V: 5,    IV: 4,
            I: 1 }.freeze

  # Converts integer to a roman numeral
  def roman
    return "-#{i2r(-self)}" if negative?

    i2r(self)
  end

  private

  def i2r(numero)
    return '' if numero.zero?

    ROMAN.each { |r, v| return r.to_s + i2r(numero - v) if v <= numero }
  end
end

# class String
class String
  # Taken from O'Reilly's Perl Cookbook 6.23. Regular Expression Grabbag.
  ROMAN_RE = /^M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$/i.freeze
  ROMAN = Integer::ROMAN

  def roman?
    ROMAN_RE.match?(upcase)
  end

  # Converts roman numeral to intger
  def roman
    return -self[/[^-]+/].roman if /-+/.match?(self)
    return 0 unless roman?

    r2i(upcase, 0)
  end

  private

  def r2i(numero, last)
    return 0 if numero.empty?

    v = ROMAN[numero[-1].to_sym]
    v < last ? (r2i(numero.chop, v) - v) : (r2i(numero.chop, v) + v)
  end
end
