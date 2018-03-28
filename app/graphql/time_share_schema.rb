TimeshareSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  rescue_from(ActiveRecord::RecordNotFound) { "Not found" }
  query Types::QueryType
  # subscription
end
