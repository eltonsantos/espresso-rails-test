# frozen_string_literal: true

module Api
  module Baas
    class WebhooksController < ApplicationController
      skip_before_action :authenticate_user!
      skip_before_action :verify_authenticity_token

      def create
        transaction_data = params.permit(:merchant, :cost, :created_at, :last4, :transaction_id, :card_id)

        statement = Statement.new(
          merchant: transaction_data[:merchant],
          cost: transaction_data[:cost].to_f / 100,
          performed_at: transaction_data[:created_at].to_datetime.in_time_zone('Brasilia'),
          transaction_id: transaction_data[:transaction_id],
          card_id: transaction_data[:card_id]
        )

        if statement.save
          render json: { message: I18n.t('api.baas.webhooks.create.success') }, status: :created
        else
          render json: { errors: statement.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
