defmodule RocketliveryWeb.Router do
  use RocketliveryWeb, :router

  alias RocketliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RocketliveryWeb do
    pipe_through :api

    get "/", WelcomeController, :index

    resources "/items", ItemsController, only: [:create]
    resources "/orders", OrdersController, only: [:create]
    resources "/users", UsersController, except: [:new, :edit]
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
