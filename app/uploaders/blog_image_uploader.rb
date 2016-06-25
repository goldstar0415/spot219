# encoding: utf-8

class BlogImageUploader < BaseUploader
  version :medium do
    process resize_to_fit: [640, 426]
  end

  version :thumb do
    process resize_to_fit: [200, 134]
  end
end
