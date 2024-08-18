# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company

  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: I18n.t('companies.create.success') }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :cnpj)
  end
end
