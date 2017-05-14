class GraphqlController < ApplicationController
  rescue_from JSON::ParserError, with: :json_parsing_error_response
  rescue_from GraphQL::ParseError, with: :json_parsing_error_response

  def create
    query_string = params[:query]
    query_variables = ensure_hash(params[:variables])
    result = Schema.execute(
      query_string,
      variables: query_variables,
      context: {}
    )

    render json: result, status: :ok
  end

  protected

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.load(query_variables)
    else
      query_variables
    end
  end

  def json_parsing_error_response(exception)
    render json: { errors: [exception.message] }, status: :bad_request
  end
end
