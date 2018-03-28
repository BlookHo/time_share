class GraphqlController < ApplicationController
  require 'time_share_schema.rb'

  # description of schema.execute method:
  # .rvm/gems/ruby-2.5.0/gems/graphql-1.7.13/lib/graphql/schema.rb
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    # operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = TimeshareSchema.execute(query, variables: variables, context: context)#, operation_name: operation_name)
    render json: result
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
