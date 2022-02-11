module Erp
  module Menus
    module Backend
      class MenusController < Erp::Backend::BackendController
        before_action :set_menu, only: [:move_up, :move_down, :archive, :unarchive, :edit, :update, :destroy]
        before_action :set_menus, only: [:archive_all, :unarchive_all, :delete_all]

        def index
        end

        def list
          @menus = Menu.search(params).paginate(page: params[:page], per_page: 20)
          render layout: nil
        end

        def new
          @menu = Menu.new
        end

        def edit
        end

        def create
          @menu = Menu.new(menu_params)
          @menu.creator = current_user
          if @menu.save
            if request.xhr?
              render json: {status: 'success', text: @menu.get_name, value: @menu.id}
            else
              redirect_to erp_menus.edit_backend_menu_path(@menu), notice: 'Tạo menu mới thành công!'
            end
          else
            render :new
          end
        end

        def update
          if @menu.update(menu_params)
            if request.xhr?
              render json: {status: 'success', text: @menu.get_name, value: @menu.id}
            else
              redirect_to erp_menus.edit_backend_menu_path(@menu), notice: 'Cập nhật menu thành công!'
            end
          else
            render :edit
            puts @menu.errors.to_json
          end
        end

        def destroy
          @menu.destroy
          respond_to do |format|
            format.html {redirect_to erp_menus.backend_menus_path, notice: 'Xóa menu thành công!'}
            format.json {render json: {'message': 'Xóa menu thành công!', 'type': 'success'}}
          end
        end

        def archive
          @menu.archive
          respond_to do |format|
            format.json {render json: {'message': 'Ẩn menu thành công!', 'type': 'success'}}
          end
        end

        def unarchive
          @menu.unarchive
          respond_to do |format|
            format.json {render json: {'message': 'Hiện menu thành công!', 'type': 'success'}}
          end
        end

        def delete_all
          @menus.destroy_all
          respond_to do |format|
            format.json {render json: {'message': 'Xóa menu được chọn thành công!', 'type': 'success'}}
          end
        end

        def archive_all
          @menus.archive_all
          respond_to do |format|
            format.json {render json: {'message': 'Ẩn menu được chọn thành công!', 'type': 'success'}}
          end
        end

        def unarchive_all
          @menus.unarchive_all
          respond_to do |format|
            format.json {render json: {'message': 'Hiện menu được chọn thành công!', 'type': 'success'}}
          end
        end

        def dataselect
          respond_to do |format|
            format.json {render json: Menu.dataselect(params[:keyword].split('/').last)}
          end
        end

        def move_up
          @menu.move_up
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        def move_down
          @menu.move_down
          respond_to do |format|
            format.json {render json: {}}
          end
        end

        private
          def set_menu
            @menu = Menu.find(params[:id])
          end

          def set_menus
            @menus = Menu.where(id: params[:ids])
          end

          def menu_params
            params.fetch(:menu, {}).permit(:is_redirect, :not_create_link, :redirect_id, :image_menu, :image_menu_title, :image_menu_link, :name, :short_name, :custom_title, :custom_alias, :description, :parent_id, :use_filter, :style_show,
                                           :meta_description, :brand_id, :menu_icon, category_ids: [], properties_value_ids: [])
          end
      end
    end
  end
end