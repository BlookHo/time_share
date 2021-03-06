class GraphqlController < ApplicationController
  require 'time_share_schema.rb'

  # description of schema.execute method:
  # .rvm/gems/ruby-2.5.0/gems/graphql-1.7.13/lib/graphql/schema.rb
  def execute
    p "In execute"
    result = TimeshareSchema.execute(
      query_string,
      variables: variables,
      context: context,
      operation_name: operation_name
    )
    render json: result
  end

  private

  def query_string
    params[:query]
  end

  def operation_name
    params[:operationName]
  end

  def context
    {
      # Query context goes here, for example:
      # current_user: current_user,
    }
  end

  def variables
    ensure_hash(params[:variables])
    # params[:variables] || {}
  end

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
