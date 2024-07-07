def caesar_cipher(string, shift_factor)
    # First argument should be a string
    unless string.is_a?String
      return "First argument should be a string"
    end
    # Second argument should be a number
    unless shift_factor.is_a?Numeric
      return "Second argument should be a number"
    end
    # string length should be equal to one or greater than one
    unless string.length >= 1
      return "Input Error"
    end
    # to convert the string to array of character's
  plain_text = string.split("")
   # convert array of string character's to ordinal number's
  string_ordnums = plain_text.map {|s| s.ord}
   #  add shift_factor to ordinal number's of alphabates only 
  add_shift = string_ordnums.map do |num|
    if (num >= 65 && num + shift_factor  < 90) || (num >= 97 && num + shift_factor < 122)
      num + shift_factor
    elsif ( num + shift_factor >= 90) || ( num + shift_factor >= 122)
      ( num - 26) + shift_factor 
    else
      num
    end
  end
  #  convert the numbers to character's also convert the array to string 
  caesar_text = add_shift.map {|num| num.chr}.join
  end
  
  puts caesar_cipher("What a string!", 5) # "Bmfy f xywnsl!"
  
  