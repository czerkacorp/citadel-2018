module Admin

  class GalaxiesController < ApplicationController

    before_action :get_galaxy_id, only: [:edit, :update]

      def index
          @galaxies = Galaxy.all
        end
      
        def create
        end
      
        def edit
        end
      
        def update
          if @galaxy.update_attributes(galaxy_params)
            @galaxy.save
            flash[:notice] = "Galaxy updated."
            redirect_to admin_galaxies_path
          else
            flash[:error] = "Could not update Galaxy."
            render :edit
          end
        end  
      
        def show
        end
        
        private

        def galaxy_params
          params.require(:galaxy).permit(:galaxy_id, :name, :address, :port, :pingport, :population)
        end
          
        def get_galaxy_id
          @galaxy = Galaxy.find_by(galaxy_id: params[:id]) || Galaxy.new(galaxy_id: params[:id])
        end

  end
end
