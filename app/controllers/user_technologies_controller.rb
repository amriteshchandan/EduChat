class UserTechnologiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_technology, only: [:show, :edit, :update, :destroy]



  # GET /user_technologies
  # GET /user_technologies.json
  def index
    @user_technologies = UserTechnology.all
  end
=begin
  # GET /user_technologies/1
  # GET /user_technologies/1.json
  def show
  end

  # GET /user_technologies/new
  def new
    @user_technology = UserTechnology.new
  end

  # GET /user_technologies/1/edit
  def edit
  end

  # POST /user_technologies
  # POST /user_technologies.json

  def create
    @user_technology = UserTechnology.new(user_technology_params)

    respond_to do |format|
      if @user_technology.save
        format.html { redirect_to @user_technology, notice: 'User technology was successfully created.' }
        format.json { render :show, status: :created, location: @user_technology }
      else
        format.html { render :new }
        format.json { render json: @user_technology.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /user_technologies/1
  # PATCH/PUT /user_technologies/1.json
  def update
    respond_to do |format|
      if @user_technology.update(user_technology_params)
        format.html { redirect_to @user_technology, notice: 'User technology was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_technology }
      else
        format.html { render :edit }
        format.json { render json: @user_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_technologies/1
  # DELETE /user_technologies/1.json
  def destroy
    @user_technology.destroy
    respond_to do |format|
      format.html { redirect_to user_technologies_url, notice: 'User technology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_technology
      @user_technology = UserTechnology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_technology_params
      params.require(:user_technology).permit(:user_id, :technology_id, :technology_type)
    end
=end

  def create
    u_id = params["user_id"].to_i
    known_tech = params["user_technology"]["known"]
    interested_tech = params["user_technology"]["interested"]
    known_tech.delete_at(0) if known_tech[0] == ""
    interested_tech.delete_at(0) if interested_tech[0] == ""
    known_tech.collect! { |arr| arr.to_i }
    interested_tech.collect! { |arr| arr.to_i }
    known_tech.each do |arr|
      UserTechnology.create(user_id: u_id, technology_id: arr, technology_type: "known")
    end
    interested_tech.each do |arr|
      UserTechnology.create(user_id: u_id, technology_id: arr, technology_type: "interested")
    end
    redirect_to root_url
  end
end
