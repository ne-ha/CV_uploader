require 'rails_helper'

describe Upload, type: :model do
  describe "file" do
    it "should be required" do
      upload = Upload.new(file: nil)
      upload.valid?
      expect(upload).to be_invalid
    end
  end
end