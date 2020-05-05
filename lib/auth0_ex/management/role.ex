defmodule Auth0Ex.Management.Role do
  @moduledoc """
  A module representing rule on Auth0
  """
  use Auth0Ex.Api, for: :mgmt
  @path "roles"

  @doc """
  Get all rules

      iex> Auth0Ex.Management.Role.all()
      iex> Auth0Ex.Management.Role.all(enabled: true, fields: "id,name")
  """
  def all(params \\ %{}) when is_map(params) or is_list(params) do
    do_get(@path, params)
  end

  @doc """
  Get a role

      iex> Auth0Ex.Management.Role.get("some_role_id")
  """
  def get(id) when is_binary(id), do: get(id, [])

  def get(id, params) when is_binary(id) and (is_map(params) or is_list(params)) do
    do_get("#{@path}/#{id}", params)
  end

  @doc """
  Create a rule


      iex> Auth0Ex.Management.Rule.create(%{name: "some_rule", script: "some_script_code"})
  """
  def create(body), do: do_post(@path, body)

  @doc """
  Update a rule

      iex> Auth0Ex.Management.Rule.update("some_rule", name: "new_name")
  """
  def update(id, body) do
    do_patch("#{@path}/#{id}", body)
  end

  @doc """
  Deletes a rule

      iex> Auth0Ex.Management.Rule.delete("some_rule")
  """
  def delete(id), do: do_delete("#{@path}/#{id}")
end
