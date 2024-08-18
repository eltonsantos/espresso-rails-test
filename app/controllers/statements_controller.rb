# frozen_string_literal: true

class StatementsController < ApplicationController
  before_action :set_statement, only: %i[edit update]
  before_action :set_categories

  # GET /statements or /statements.json
  def index
    @statements = current_user.admin? ? admin_statements : user_statements
  end

  # GET /statements/1/edit
  def edit
    @statement.build_attachment unless @statement.attachment
  end

  # PATCH/PUT /statements/1 or /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to statements_url, notice: I18n.t('statements.update.success') }
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
    redirect_to statements_url, notice: I18n.t('statements.archive.success')
  end

  private

  def set_statement
    @statement = Statement.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def statement_params
    params.require(:statement).permit(:performed_at, :cost, :merchant, :transaction_id, :card_id, :category_id,
                                      attachment_attributes: [:file])
  end

  def admin_statements
    @statements = Statement.by_company(current_user.company_id)
                           .not_archived
                           .ordered_by_performed_at
    @archived_statements = Statement.by_company(current_user.company_id)
                                    .archived
                                    .ordered_by_performed_at
  end

  def user_statements
    @statements = Statement.by_user(current_user.id)
                           .not_archived
                           .ordered_by_performed_at
  end
end
