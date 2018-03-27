ResortType = GraphQL::ObjectType.define do
  name 'Resort'
  description 'A Resort Type'

  field :id, types.ID
  field :name, types.String
  field :email, types.String
  field :description, types.String
  field :apartments do
    type types[ApartmentType] # types declaration for collection
    argument :size, types.Int, default_value: 10
    resolve -> (resort, args, ctx) {
      resort.apartments.limit(args[:size])
    }
  end
end
