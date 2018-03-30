Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for TimeshareSchema'
  # root-level fields here.
  # Entry points for queries on TimeshareSchema.

  # All resorts
  field :all_resorts do
    type types[ResortType] # types declaration for collection
    description 'All Resorts everywhere'
    argument :size,
             types.Int,
             default_value: 15
    resolve ->(obj, args, ctx) {
      Resort.all.limit(args[:size]).order(id: :asc)
    }
  end

  # All apartments
  field :all_apartments do
    type types[ApartmentType]
    description 'All Apartment everywhere'
    argument :size,
             types.Int,
             default_value: 15
    resolve ->(obj, args, ctx) {
      Apartment.all.limit(args[:size]).order(id: :asc)
    }
  end

  # One resort
  field :resort do
    type ResortType
    argument :id, !types.ID
    description 'One Resort by its ID'
    resolve ->(obj, args, ctx) {
      Resort.find(args[:id])
    }
  end

  # One apartment
  field :apartment do
    type ApartmentType
    argument :id, !types.ID
    description 'One Apartment by its ID'
    resolve ->(obj, args, ctx) {
      Apartment.find(args[:id])
    }
  end

  # One apartment by :room_type
  field :apartment_by_room_type do
    type types[ApartmentType]
    argument :room_type, !types.String
    description 'One Apartment by :room_type'
    resolve ->(obj, args, ctx) {
      Apartment.by_room_type(args[:room_type])
    }
  end

  # TODO: remove me
  field :testField, types.String do
    description 'An example field added by the generator'
    resolve ->(obj, args, ctx) {
      'Hello World!'
    }
  end

  # fragment apartmentFields on ApartmentType {
  #   # field :id, types.ID
  #   field :room_type, types.String
  #   field :description, types.String
  #   field :resort_id, types.ID
  # }
end

