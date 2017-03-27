# USER
user = Erp::User.first
# CREATE MENU SIDEBAR
puts "Create side menu"
father2 = Erp::Menus::Menu.create(
  name: "Menu Sidebar",
  menu_type: Erp::Menus::Menu::MENU_SIDEBAR,
  creator_id: user.id,
  parent_id: nil
)
  # Sản phẩm HP
  father21 = father2.children.create(
    name: "Sản Phẩm HP",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
    # Máy Tính Xách Tay - Laptop
    father211 = father21.children.create(
      name: "Máy Tính Xách Tay - Laptop",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father211.children.create(
        name: "Dòng Elitebook",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father211.children.create(
        name: "Dòng Pavilion",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father211.children.create(
        name: "Dòng Probook",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father211.children.create(
        name: "Dòng Envy",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )         
      father211.children.create(
        name: "Dòng Khác",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
    # Máy Tính Để Bàn
    father212 = father21.children.create(
      name: "Máy Tính Để Bàn",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father212.children.create(
        name: "Máy Tính Cá Nhân - PC",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father212.children.create(
        name: "Máy Tính Chuyên Dụng - Workstation",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father212.children.create(
        name: "Máy Tính All In One",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father212.children.create(
        name: "Máy Tính Thin Client",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
    # Máy Chủ - Server
    father213 = father21.children.create(
      name: "Máy Chủ - Server",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
    # Thiết Bị Chuyển Mạch - Switch
    father214 = father21.children.create(
      name: "Thiết Bị Chuyển Mạch - Switch",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    ) 
    # Sản Phẩm Lưu Trữ - Storage
    father215 = father21.children.create(
      name: "Sản Phẩm Lưu Trữ - Storage",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father215.children.create(
        name: "NAS Storage",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father215.children.create(
        name: "SAN Storage",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father215.children.create(
        name: "Phụ Kiện Storage",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      ) 
    # Sản Phẩm Văn Phòng
    father216 = father21.children.create(
      name: "Sản Phẩm Văn Phòng",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father216.children.create(
        name: "Máy In",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father216.children.create(
        name: "Máy In Phun",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father216.children.create(
        name: "Mực In",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father216.children.create(
        name: "Máy Scan",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father216.children.create(
        name: "Máy Vẽ Kỹ Thuật",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
    # Màn Hình Máy Tính
    father217 = father21.children.create(
      name: "Màn Hình Máy Tính",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
    # Phụ Kiện & Sản Phẩm Khác
    father218 = father21.children.create(
      name: "Phụ Kiện & Sản Phẩm Khác",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father218.children.create(
        name: "Máy Tính Tiền - RPOS",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father218.children.create(
        name: "Module Quang SFP",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father218.children.create(
        name: "Bộ Sạc Nguồn",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father218.children.create(
        name: "Pin Nguồn",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father218.children.create(
        name: "Bàn Phím - Chuột",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father218.children.create(
        name: "Ổ Đĩa Cứng",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )      
      father218.children.create(
        name: "Loa - Tai Nghe",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father218.children.create(
        name: "Balo Laptop",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
  # MÁY TÍNH
  father22 = father2.children.create(
    name: "Máy Tính",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
    # MÁY TÍNH BẢNG - TABLET
    father22.children.create(
      name: "Máy Tính Bảng - Tablet",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
    # MÁY TÍNH XÁCH TAY - LAPTOP
    father221 = father22.children.create(
      name: "Máy Tính Xách Tay - Laptop",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      # ACER
      father221.children.create(
        name: "Acer",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # ASUS
      father221.children.create(
        name: "Asus",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # HP
      father221.children.create(
        name: "HP",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # DELL
      father221.children.create(
        name: "Dell",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # LENOVO
      father221.children.create(
        name: "Lenovo",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # TOSHIBA
      father221.children.create(
        name: "Toshiba",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # MÁY TÍNH ALL IN ONE
      father221.children.create(
        name: "ALL IN ONE",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      # KHÁC
      father221.children.create(
        name: "Khác",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
    # PHỤ KIỆN MÁY TÍNH BẢNG
    father222 = father22.children.create(
      name: "Phụ Kiện Máy Tính Bảng",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father222.children.create(
        name: "Bao da - Ốp lưng",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Bàn phím - Docking",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
    # PHỤ KIỆN MÁY TÍNH XÁCH TAY
    father222 = father22.children.create(
      name: "Phụ Kiện Máy Tính Xách Tay",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_SIDEBAR
    )
      father222.children.create(
        name: "Ram",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "DVD",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Pin",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Adapter",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Keyboard",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Khóa - Đèn bàn",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Quạt Tản Nhiệt",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Túi xách - Balo - Túi đệm",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Bàn Notebook",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "LCD",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
      father222.children.create(
        name: "Miếng dán laptop | Miếng dán bàn phím laptop chống bụi | Miếng dán LCD chống nhìn trộm",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_SIDEBAR
      )
  # THIẾT BỊ TIN HỌC
  father23 = father2.children.create(
    name: "Thiết Bị Tin Học",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
  # THIẾT BỊ MẠNG
  father24 = father2.children.create(
    name: "Thiết Bị Mạng",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
  # THIẾT BỊ KỸ THUẬT SỐ
  father25 = father2.children.create(
    name: "Thiết Bị Kỹ Thuật Số",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
  # THIẾT BỊ VĂN PHÒNG
  father26 = father2.children.create(
    name: "Thiết Bị Văn Phòng",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
  # ĐIỆN THOẠI
  father27 = father2.children.create(
    name: "Điện Thoại",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
  # THÔNG TIN KHUYẾN MÃI
  father28 = father2.children.create(
    name: "Thông Tin Khuyến Mãi",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
  # DỊCH VỤ SỬA CHỬA
  father29 = father2.children.create(
    name: "Dịch Vụ Sửa Chửa",
    creator_id: user.id,
    menu_type: Erp::Menus::Menu::MENU_SIDEBAR
  )
# HOT CATEGORY 1
puts "Create menu hot"
father3 = Erp::Menus::Menu.create(
  name: "Menu Hot",
  menu_type: Erp::Menus::Menu::MENU_HOT,
  creator_id: user.id,
  parent_id: nil
)
  # MÁY TÍNH
  father31 = father3.children.create(
    name: "Máy Tính",
    creator_id: user.id,
    style_icon: '<i class="fa fa-laptop"></i>',
    style_color: Erp::Menus::Menu::STYLE_COLOR_1,
    menu_type: Erp::Menus::Menu::MENU_HOT
  )
    father311 = father31.children.create(
      name: "Máy Tính Xách Tay",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father311.children.create(
        name: "Acer",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "Asus",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "HP",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "Dell",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "Lenovo",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "Toshiba",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "All In One",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father311.children.create(
        name: "Khác",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
    father312 = father31.children.create(
      name: "Máy Tính Để Bàn",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father312.children.create(
        name: "Tìm Hàng Công Nghệ",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father312.children.create(
        name: "Acer",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father312.children.create(
        name: "Asus",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father312.children.create(
        name: "Dell",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father312.children.create(
        name: "HP",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father312.children.create(
        name: "Lenovo",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father312.children.create(
        name: "Khác",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
    father313 = father31.children.create(
      name: "Máy Chủ - Server",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father313.children.create(
        name: "Dell",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father313.children.create(
        name: "HP",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father313.children.create(
        name: "Lenovo",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father313.children.create(
        name: "Robo",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father313.children.create(
        name: "Lắp theo yêu cầu",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
    father314 = father31.children.create(
      name: "Phần Mềm",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father314.children.create(
        name: "Phần Mềm Microsoft",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father314.children.create(
        name: "Phần Mềm Office",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father314.children.create(
        name: "Phần Mềm Diệt Virus",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father314.children.create(
        name: "Phần Mềm Ứng Dụng",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
    father315 = father31.children.create(
      name: "Phụ Kiện",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father315.children.create(
        name: "Ram",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father315.children.create(
        name: "Pin",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father315.children.create(
        name: "Adapter",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father315.children.create(
        name: "Keyboard",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father315.children.create(
        name: "Quạt tản nhiệt",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
  # THIẾT BỊ TIN HỌC
  father32 = father3.children.create(
    name: "Thiết Bị Tin Học",
    creator_id: user.id,
    style_icon: '<i class="fa fa-headphones"></i>',
    style_color: Erp::Menus::Menu::STYLE_COLOR_2,
    menu_type: Erp::Menus::Menu::MENU_HOT
  )
    father321 = father32.children.create(
      name: "Mainboard",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father321.children.create(
        name: "ASRock",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father321.children.create(
        name: "Asus",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father321.children.create(
        name: "Foxcom",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father321.children.create(
        name: "Gigabyte",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father321.children.create(
        name: "Intel",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father321.children.create(
        name: "MSI",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father321.children.create(
        name: "Socket AMD",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
    father322 = father32.children.create(
      name: "CPU - Bộ Xử Lý",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father322.children.create(
        name: "CPU AMD",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father322.children.create(
        name: "CPU Intel",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
    father323 = father32.children.create(
      name: "Ram",
      creator_id: user.id,
      menu_type: Erp::Menus::Menu::MENU_HOT
    )
      father323.children.create(
        name: "Kingmax",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father323.children.create(
        name: "Kingston",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father323.children.create(
        name: "Corsair",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father323.children.create(
        name: "Team",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father323.children.create(
        name: "G.Skill",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father323.children.create(
        name: "Geil",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
      father323.children.create(
        name: "Panram",
        creator_id: user.id,
        menu_type: Erp::Menus::Menu::MENU_HOT
      )
  # THIẾT BỊ VĂN PHÒNG
  father33 = father3.children.create(
    name: "Thiết Bị Văn Phòng",
    creator_id: user.id,
    style_icon: '<i class="fa fa-print"></i>',
    style_color: Erp::Menus::Menu::STYLE_COLOR_3,
    menu_type: Erp::Menus::Menu::MENU_HOT
  )
  # THIẾT BỊ KỸ THUẬT SỐ
  father34 = father3.children.create(
    name: "Thiết Bị Kỹ Thuật Số",
    creator_id: user.id,
    style_icon: '<i class="fa fa-video-camera"></i>',
    style_color: Erp::Menus::Menu::STYLE_COLOR_1,
    menu_type: Erp::Menus::Menu::MENU_HOT
  )
  # THIẾT BỊ MẠNG
  father35 = father3.children.create(
    name: "Thiết Bị Mạng",
    creator_id: user.id,
    style_icon: '<i class="fa fa-wifi"></i>',
    style_color: Erp::Menus::Menu::STYLE_COLOR_2,
    menu_type: Erp::Menus::Menu::MENU_HOT
  )