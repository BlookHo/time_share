Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  # field :createResort do
    # type CreateResortMutation

    #, field: CreateResortMutation.field
  # end

  # TODO: Remove me
  field :testField, types.String do
    description 'An example field added by the generator'
    resolve -> (obj, args, ctx) {
      'Hello World!'
    }
  end
end
