defmodule Auth0Ex.Management.Guardian do
  @moduledoc """
  A module representing guardian Auth0 functionality
  """
  use Auth0Ex.Api, for: :mgmt
  @path "guardian/enrollments"

  @doc """
  Reset Enrollment

      iex> Auth0Ex.Management.Guardian.reset_mfa("some_enrolmentid")
  """
  def reset_mfa(enrollment_id) do
    do_delete(@path <> "/#{enrollment_id}")
  end
end
