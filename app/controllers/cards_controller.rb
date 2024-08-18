# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update]
  before_action :set_users, only: %i[new edit]

  # GET /cards or /cards.json
  def index
    @cards = Card.joins(:user).where(users: { company_id: current_user.company_id })
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to cards_url, notice: I18n.t('cards.create.success') }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to cards_url, notice: I18n.t('cards.update.success') }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def set_users
    @users = User.where(role: 'employee')
  end

  def card_params
    params.require(:card).permit(:last4, :user_id)
  end
end
