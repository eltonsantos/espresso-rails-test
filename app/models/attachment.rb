# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :statement
  has_attached_file :file
  validates_attachment :file, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
end
