ApartmentType = GraphQL::ObjectType.define do
  name 'Apartment'
  description 'An Apartment Type'
  field :id, types.ID
  field :room_type, types.String
  field :description, types.String
  field :resort_id, types.ID
end
