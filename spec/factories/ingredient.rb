FactoryBot.define do
  factory :ingredient do
    name { "Ingredient" }
    energy { 100 }
    carbohydrate { 100 }
    salt { 100 }
    protein { 100 }
    lipids { 100 }
    sugar { 100 }
    fibers { 100 }
    saturated_fatty_acids { 100 }
    archived { false }
  end
end