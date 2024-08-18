# frozen_string_literal: true

module Api
  module Baas
    class WebhooksController < ApplicationController
      skip_before_action :authenticate_user!
      skip_before_action :verify_authenticity_token

      def create
        statement = build_statement

        return unless statement.save

        render json: { message: I18n.t('api.baas.webhooks.create.success') }, status: :created
      end

      private

      def transaction_params
        params.permit(:merchant, :cost, :created_at, :last4, :transaction_id, :card_id)
      end

      def build_statement
        Statement.new(
          merchant: transaction_params[:merchant],
          cost: transaction_params[:cost].to_f / 100,
          performed_at: transaction_params[:created_at].to_datetime.in_time_zone('Brasilia'),
          transaction_id: transaction_params[:transaction_id],
          card_id: transaction_params[:card_id]
        )
      end
    end
  end
end
