FactoryBot.define do
  factory :purchase_address do
    token { 'sample_token' }
    price           { 4000 }
    postalCode      { '987-6543' }
    state_id        { 14 }
    city            { '多摩市' }
    block_number    { '2-3' }
    building_name   { 'ほげ' }
    phoneNumber     { '09087654321' }
  end
end
