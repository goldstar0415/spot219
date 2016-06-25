# encoding: utf-8

class AvatarUploader < BaseUploader
  version :thumb do
    process resize_to_fill: [55, 55]
  end
end
