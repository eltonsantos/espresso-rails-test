puts "Criando empresas"
company1 = Company.create!(name: "CGE", cnpj: "12.345.678/0001-90")
company2 = Company.create!(name: "CAGECE", cnpj: "98.765.432/0001-01")

puts "Criando categorias"
categories_company1 = [
  "Alimentação",
  "Transporte",
  "Saúde"
].map { |name| Category.create!(name: name, company: company1) }

categories_company2 = [
  "Educação",
  "Entretenimento",
  "Saúde",
].map { |name| Category.create!(name: name, company: company2) }

admin1 = User.create!(
  email: "admin1@cge.com",
  password: "123456",
  name: "Admin 1",
  role: :admin,
  company: company1
)

admin = User.create!(
  email: "admin2@cagece.com",
  password: "123456",
  name: "Admin 2",
  role: :admin,
  company: company2
)

employee1 = User.create!(
  email: "elton@cge.com",
  password: "123456",
  name: "Elton",
  role: :employee,
  company: company1
)

employee2 = User.create!(
  email: "eric@cge.com",
  password: "123456",
  name: "Eric",
  role: :employee,
  company: company1
)

employee3 = User.create!(
  email: "rose@cagece.com",
  password: "123456",
  name: "Rose",
  role: :employee,
  company: company2
)

puts "Criando cartões"
cards_employee1 = [
  Card.create!(last4: "1234", user: employee1),
  Card.create!(last4: "5678", user: employee1)
]

cards_employee2 = [
  Card.create!(last4: "8765", user: employee2),
  Card.create!(last4: "4321", user: employee2)
]

cards_employee3 = [
  Card.create!(last4: "0010", user: employee3),
  Card.create!(last4: "9009", user: employee3)
]

puts "Criando despesas"
def create_statements(user, cards, categories)
  5.times do |i|
    Statement.create!(
      performed_at: Time.now - i.days,
      cost: rand(10..50),
      merchant: "Estabeleciomento #{i + 1}",
      transaction_id: "TX#{i + 1}",
      card: cards.sample,
      category: categories.sample
    )
  end
end
create_statements(employee1, cards_employee1, categories_company1)
create_statements(employee2, cards_employee2, categories_company1)
create_statements(employee3, cards_employee3, categories_company2)