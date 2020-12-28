require 'spec_helper'

RSpec.describe String, "#to_emoji" do
  context "when given an existing weather description" do
    it "converts the string description to an emoji" do
      emojis = ['rain', 'cold', 'hot', 'unknown'].map {|string| string.to_emoji}
      expect(emojis).to  eq ["\u{2614}", "\u{2744}", "\u{1F525}", "\u{1F30A}"]
    end
  end
end
