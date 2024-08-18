# frozen_string_literal: true

module CardsHelper
  def user_select(form, users)
    users = users.where(company_id: current_user.company_id)
    form.collection_select(:user_id, users, :id, :name, prompt: 'Selecione um funcionário')
  end
end
