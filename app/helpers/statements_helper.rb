# frozen_string_literal: true

module StatementsHelper
  def proof_status(statement)
    statement.proof ? 'Comprovada' : 'Não Comprovada'
  end

  def formatted_cost(cost)
    number_to_currency(cost.to_f, unit: 'R$ ', separator: ',', delimiter: '.', precision: 2)
  end

  def formatted_date(date)
    date.strftime('%d/%m/%Y') if date.present?
  end

  def category_select(form, categories)
    categories = categories.where(company_id: current_user.company_id)
    form.collection_select(:category_id, categories, :id, :name, prompt: 'Selecione uma categoria')
  end

  def display_image(statement)
    return if statement.attachment.blank?

    image_tag(statement.attachment.file.url(:thumb))
  end

  def display_card(statement)
    statement.card ? statement.card.last4 : '-'
  end

  def display_employee_name(statement)
    statement.card&.user&.name ? statement.card.user.name : '-'
  end

  def display_category(statement)
    statement.category ? statement.category.name : 'Sem classificação'
  end
end
