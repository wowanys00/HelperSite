FactoryBot.define do
  factory :user do
    firstname {"a"}
    lastname {"b"}
    phone {"c"}
    age {18}
    bio {"просто крутий пацан"}
    email {"x@x.x"}
    password { '123456' }
    password_confirmation { '123456' }
  end
end