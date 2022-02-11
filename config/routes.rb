Erp::Menus::Engine.routes.draw do
  scope '(:locale)', locale: /en|vi/ do
		namespace :backend, module: 'backend', path: 'backend/menus' do
			resources :menus do
				collection do
					post 'list'
					get 'dataselect'
					put 'move_up'
          put 'move_down'
					put 'archive'
					put 'unarchive'
					put 'archive_all'
					put 'unarchive_all'
					delete 'delete_all'
				end
			end
			resources :related_menus do
				collection do
          get 'related_menu_line_form'
				end
			end
		end
	end
end