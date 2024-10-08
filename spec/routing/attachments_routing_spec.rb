# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttachmentsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/attachments').to route_to('attachments#index')
    end

    it 'routes to #new' do
      expect(get: '/attachments/new').to route_to('attachments#new')
    end

    it 'routes to #show' do
      expect(get: '/attachments/1').to route_to('attachments#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/attachments/1/edit').to route_to('attachments#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/attachments').to route_to('attachments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/attachments/1').to route_to('attachments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/attachments/1').to route_to('attachments#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/attachments/1').to route_to('attachments#destroy', id: '1')
    end
  end
end
