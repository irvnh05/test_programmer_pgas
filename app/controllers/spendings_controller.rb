class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[ show edit update destroy ]

  def chart
    @spendings = Spending.includes(:employee => :departement).all
  end
  def slide
    @spendings_by_department = Spending.all.group_by { |s| s.employee.departement.name }
  end  
  # GET /spendings or /spendings.json
  def index
    @spendings = Spending.all
  end

  # GET /spendings/1 or /spendings/1.json
  def show
  end

  # GET /spendings/new
  def new
    @employee = Employee.all
    @spending = Spending.new
  end

  # GET /spendings/1/edit
  def edit
    @employee = Employee.all
  end

  # POST /spendings or /spendings.json
  def create
    @spending = Spending.new(spending_params)

    respond_to do |format|
      if @spending.save
        format.html { redirect_to spending_url(@spending), notice: "Spending was successfully created." }
        format.json { render :show, status: :created, location: @spending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spendings/1 or /spendings/1.json
  def update
    respond_to do |format|
      if @spending.update(spending_params)
        format.html { redirect_to spending_url(@spending), notice: "Spending was successfully updated." }
        format.json { render :show, status: :ok, location: @spending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spendings/1 or /spendings/1.json
  def destroy
    @spending.destroy

    respond_to do |format|
      format.html { redirect_to spendings_url, notice: "Spending was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spending
      @spending = Spending.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spending_params
      params.require(:spending).permit(:employee_id, :date, :value)
    end
end
