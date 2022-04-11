defmodule RocketliveryWeb.Graphql.Utils.AtomToKey do
  def call(params) do
    for {key, val} <- params, into: %{}, do: {Atom.to_string(key), val}
  end
end
