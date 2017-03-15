# USER
user = Erp::User.first
puts "Create topbar menu"
# CREATE MENU TOP BAR
father1 = Erp::Menus::Menu.create(
  name: "Menu Topbar",
  menu_type: Erp::Menus::Menu::MENU_TOP_BAR,
  creator_id: user.id,
  parent_id: nil
)
  # THIẾT BỊ TIN HỌC
  father11 = father1.children.create(
    name: "Thiết Bị Tin Học",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_TOP_BAR
  )
    # MÁY VI TÍNH
    father111 = father11.children.create(
      name: "Máy Vi Tính",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_TOP_BAR
    )
      father111.children.create(
        name: "Máy Tính Xách Tay (Laptop)",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_TOP_BAR
      )
      father111.children.create(
        name: "Linh Kiện - Phụ Kiện (Laptop)",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_TOP_BAR
      )
      father111.children.create(
        name: "Máy Tính Để Bàn (PC)",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_TOP_BAR
      )
      father111.children.create(
        name: "Linh Kiện Máy Chủ",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_TOP_BAR
      )
      father111.children.create(
        name: "Máy Chủ (Server)",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_TOP_BAR
      )
      father111.children.create(
        name: "Màn Hình Máy Tính",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_TOP_BAR
      )
    # LINH KIỆN MÁY TÍNH
    father112 = father11.children.create(
      name: "Linh Kiện Máy Tính",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_TOP_BAR
    )
    # MÁY TÍNH BẢNG - TABLET
    father113 = father11.children.create(
      name: "Máy Tính Bảng - Tablet",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_TOP_BAR
    )
    # PHẦN MỀM MÁY TÍNH
    father114 = father11.children.create(
      name: "Phần Mềm Máy Tính",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_TOP_BAR
    )
  # THIẾT BỊ VĂN PHÒNG
  father1.children.create(
    name: "Thiết Bị Văn Phòng",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_TOP_BAR
  )
  # THIẾT BỊ MẠNG
  father1.children.create(
    name: "Thiết Bị Mạng",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_TOP_BAR
  )
  # THIẾT BỊ VIỄN THÔNG
  father1.children.create(
    name: "Thiết Bị Viễn Thông",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_TOP_BAR
  )
  # THIẾT BỊ AN NINH
  father1.children.create(
    name: "Thiết Bị An Ninh",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_TOP_BAR
  )