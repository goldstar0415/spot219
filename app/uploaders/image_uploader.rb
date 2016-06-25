# encoding: utf-8

class ImageUploader < BaseUploader
  version :medium do
    process resize_to_fill: [640, 426]
  end

  version :thumb do
    process resize_to_fill: [200, 134]
  end
end
