defmodule Rocketlivery.Users.CreateTest do
  use Rocketlivery.DataCase, async: true

  alias Rocketlivery.{Error, User}
  alias Rocketlivery.Users.Create

  import Rocketlivery.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 26, email: "beneditomarcoscavalcanti@vasconcelosdias.com"}} =
               response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{age: 15, password: "123"})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      assert errors_on(changeset) == expected_response
    end
  end
end
