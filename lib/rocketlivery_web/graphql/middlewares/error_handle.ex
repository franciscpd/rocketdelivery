defmodule RocketliveryWeb.Graphql.Middlewares.ErrorHandler do
  @behaviour Absinthe.Middleware

  alias Ecto.Changeset
  alias Rocketlivery.Error

  @impl true
  def call(resolution, _config) do
    errors =
      resolution.errors
      |> Enum.flat_map(&to_absinthe_format/1)

    %{resolution | errors: errors}
  end

  defp to_absinthe_format(%Error{status: _status, result: reason}) do
    case reason do
      %Changeset{} -> translate_errors(reason)
      _ -> [reason]
    end
  end

  defp to_absinthe_format(error), do: error

  defp translate_errors(changeset) do
    Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", translate_value(value))
      end)
    end)
    |> Enum.map(fn {k, v} ->
      "#{k}: #{v}"
    end)
  end

  defp translate_value({:parameterized, Ecto.Enum, _map}), do: ""
  defp translate_value(value), do: to_string(value)
end
