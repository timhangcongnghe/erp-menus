module Erp::Menus
  class MenusProductsCategory < ApplicationRecord
    belongs_to :menu
    belongs_to :category
  end
end
