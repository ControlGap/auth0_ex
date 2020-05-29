defmodule Auth0Ex.Authentication.Passwordless do
  @moduledoc """
  A module that handles passwordless login stuff for authentication API

  https://auth0.com/docs/api/authentication#passwordless
  """

  use Auth0Ex.Api

  @doc """
  Passwordless connections do not require the user to remember a password. Instead, another mechanism is used to prove identity, such as a one-time code sent through email or SMS, every time the user logs in.


  Starts the passwordless auth flow with an email or sms connection

      iex> Auth0Ex.Authentication.Passwordless.start("client_id", "client_secret", :email, "user@test.com", :link, %{scope: "openid", state: "somestate"})
  """
  def start(client_id, client_secret, connection, email_address, type, params \\ %{})

  def start(client_id, client_secret, :email, email_address, type, params) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      connection: "email",
      email: email_address,
      send: to_string(type),
      authParams: params
    }

    do_post("passwordless/start", payload)
  end

  def start(client_id, client_secret, :sms, phone_number, type, params) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      connection: "sms",
      phone_number: phone_number,
      send: to_string(type),
      authParams: params
    }

    do_post("passwordless/start", payload)
  end

  @doc """
  Once you have a verification code, use this endpoint to login the user with their phone number/email and verification code.
  """
  def verify(client_id, client_secret, connection, username, otp, scope)

  def verify(client_id, client_secret, :email, username, otp, scope) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      connection: "email",
      username: username,
      password: otp,
      scope: scope
    }

    do_post("passwordless/verify", payload)
  end

  def verify(client_id, client_secret, :sms, username, otp, scope) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      connection: "sms",
      username: username,
      password: otp,
      scope: scope
    }

    do_post("passwordless/verify", payload)
  end
end
