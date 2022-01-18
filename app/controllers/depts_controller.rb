class DeptsController < ApplicationController
  before_action :set_dept, only: [:show, :update, :destroy]

  # GET /depts
  def index
    @str = 'id > 0'

  if (!params[:search].blank?)
    @str += " AND (UPPER(dep_name) LIKE '%"+params[:search].upcase+"%' OR UPPER(dep_name) LIKE '%"+params[:search].upcase+"%')"
  end
  if (!params[:page].blank?)
    @depts = Dept.where(@str).limit(2).offset(params[:page].to_i*2)
  else
      @depts= Dept.where(@str)
  end  
  render json: @depts, status: :ok
end

  # GET /depts/1
  def show
    render json: @dept
  end

  # POST /depts
  def create
    @dept = Dept.new(dept_params)

    if @dept.save
      render json: @dept, status: :created, location: @dept
    else
      render json: @dept.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /depts/1
  def update
    if @dept.update(dept_params)
      render json: @dept
    else
      render json: @dept.errors, status: :unprocessable_entity
    end
  end

  # DELETE /depts/1
  def destroy
    @dept.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dept
      @dept = Dept.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dept_params
      params.require(:dept).permit(:dep_name)
    end
end
