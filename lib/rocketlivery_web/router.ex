defmodule RocketliveryWeb.Router do
  use RocketliveryWeb, :router

  alias RocketliveryWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  pipeline :auth do
    plug RocketliveryWeb.Auth.Pipeline
  end

  scope "/api", RocketliveryWeb do
    pipe_through [:api, :auth]

    resources "/items", ItemsController, only: [:create]
    resources "/orders", OrdersController, only: [:create]
    resources "/users", UsersController, except: [:new, :edit, :create]
  end

  scope "/api", RocketliveryWeb do
    pipe_through :api

    get "/", WelcomeController, :index

    resources "/sessions", SessionsController, only: [:create]
    resources "/users", UsersController, only: [:create]
  end

  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
