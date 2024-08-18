# frozen_string_literal: true

class StatementsController < ApplicationController
  before_action :set_statement, only: %i[ show edit update destroy ]
  before_action :set_categories

  # GET /statements or /statements.json
  def index
    if current_user.admin?
      @statements = Statement.joins(card: :user).where(users: { company_id: current_user.company_id }, archived: false).order(performed_at: :desc)
      @archived_statements = Statement.joins(card: :user).where(users: { company_id: current_user.company_id }, archived: true).order(performed_at: :desc)
    else
      @statements = Statement.joins(:card).where(cards: { user_id: current_user.id }, archived: false).order(performed_at: :desc)
    end
  end

  # GET /statements/new
  def new
    @statement = Statement.new
    @statement.build_attachment
  end

  # GET /statements/1/edit
  def edit
    @statement.build_attachment unless @statement.attachment
  end

  # POST /statements or /statements.json
  def create
    @statement = Statement.new(statement_params)

    respond_to do |format|
      if @statement.save
        format.html { redirect_to statements_url, notice: "Statement was successfully created." }
        format.json { render :show, status: :created, location: @statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statements/1 or /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to statements_url, notice: "Statement was successfully updated." }
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    @statement = Statement.find(params[:id])
    @statement.update(archived: true)
    redirect_to statements_url, notice: "Statement successfully archived."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def statement_params
      params.require(:statement).permit(:performed_at, :cost, :merchant, :transaction_id, :card_id, :category_id, attachment_attributes: [:file])
    end
end
