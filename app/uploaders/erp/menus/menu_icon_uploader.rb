module Erp
  module Menus
    class MenuIconUploader < CarrierWave::Uploader::Base
      include CarrierWave::MiniMagick
      storage :file
      def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
      version :thumb20x20 do
				process resize_to_fill: [20, 20]
			end
    end
  end
end