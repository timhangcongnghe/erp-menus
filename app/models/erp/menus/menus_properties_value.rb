module Erp::Menus
  class MenusPropertiesValue < ApplicationRecord
    belongs_to :menu, class_name: 'Erp::Menus::Menu'
    belongs_to :properties_value, class_name: 'Erp::Products::PropertiesValue'
  end
end