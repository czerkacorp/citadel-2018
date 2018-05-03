class GalaxiesController < ApplicationController

    def index
        @galaxies = Galaxy.all
      end
    
      def create
      end
    
      def edit
        @user = Galaxy.find(params[:id])
      end
    
      def update
      end  
    
      def show
        @user = Galaxy.find(params[:id])
      end

end
