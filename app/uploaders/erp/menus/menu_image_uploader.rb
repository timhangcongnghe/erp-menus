module Erp
  module Menus
    class MenuImageUploader < CarrierWave::Uploader::Base
      include CarrierWave::MiniMagick
      storage :file
      def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
      version :thumb200x200 do
				process resize_and_pad: [200, 200, '#FFFFFF', 'Center']
			end
    end
  end
end