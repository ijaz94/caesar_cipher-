require_relative '../lib/caesar_cipher' # assuming your file is named caesar_cipher.rb

RSpec.describe "#caesar_cipher" do
  context "with valid inputs" do
    it "shifts lowercase letters correctly" do
      expect(caesar_cipher("abc", 1)).to eq("bcd")
    end

    it "shifts uppercase letters correctly" do
      expect(caesar_cipher("ABC", 1)).to eq("BCD")
    end

    it "wraps around from z to a" do
      expect(caesar_cipher("xyz", 3)).to eq("abc")
    end

    it "wraps around from Z to A" do
      expect(caesar_cipher("XYZ", 3)).to eq("ABC")
    end

    it "handles mixed case strings" do
      expect(caesar_cipher("AbC", 2)).to eq("CdE")
    end

    it "keeps non-alphabetic characters unchanged" do
      expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
    end

    it "handles large shift factors" do
      expect(caesar_cipher("abc", 26)).to eq("abc") # full rotation
      expect(caesar_cipher("abc", 27)).to eq("bcd") # rotation + 1
    end

    it "handles negative shift factors" do
      expect(caesar_cipher("bcd", -1)).to eq("abc")
    end
  end

  context "with invalid inputs" do
    it "returns error when first argument is not a string" do
      expect(caesar_cipher(123, 5)).to eq("First argument should be a string")
    end

    it "returns error when second argument is not a number" do
      expect(caesar_cipher("abc", "5")).to eq("Second argument should be a number")
    end

    it "returns error when string is empty" do
      expect(caesar_cipher("", 5)).to eq("Input Error")
    end
  end
end
