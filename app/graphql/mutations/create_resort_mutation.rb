CreateResortMutation = GraphQL::Relay::Mutation.define do
  name 'createResort'

  input_field :name, !types.String
  input_field :email, !types.String
  input_field :description, !types.String
  # input_field :fee_in_cents, !types.Int
  return_type ResortType

  resolve ->(_object, inputs, _ctx) {
    OpenStruct.new(
      # id: 1231,
      name: inputs[:name],
      email: inputs[:email],
      description: inputs[:description]
    )
  }
end