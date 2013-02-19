class ProfilesController < ApplicationController

def index
end

def new # wird angezeigt -> leitet am ende zu create
  @profile = Profile.new
  @profile.user_id = current_user.id
end


def create # wird nicht angezeigt. ist nur zum controllen "post"
  @profile = Profile.new(params[:profile])

    if @profile.save
      redirect_to root_path, notice: 'Profile was successfully created.'
    else
      render action: "new"
    end
  end


  def edit # wird angezeigt -> leitet am ende zu update    
    @profile = Profile.find(params[:id])
  end
  
  def update # nicht. nur control.
    @profile = Profile.find(params[:id])

      if @profile.update_attributes(params[:profile])
        redirect_to @profile.user, notice: 'Profile was successfully updated.'
      else
        render action: "edit"
      end
    end


end