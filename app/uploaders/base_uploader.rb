# encoding: utf-8

class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    Rails.root.join 'tmp/uploads'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
    ActionController::Base.helpers.asset_path([mounted_as, '_', version_name, ".png"].compact.join(''))
  #
    # "/images/" + [version_name, ".png"].compact.join('')
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end
end
