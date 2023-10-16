defmodule DummyWeb.Router do
  use DummyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {DummyWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DummyWeb do
    pipe_through :browser

    get "/", PageController, :home

    # async / foundation
    live "/async_demo1", Async.Example1Live, :index
    live "/async_demo2", Async.Example2Live, :index
    live "/async_demo3", Async.Example3Live, :index
    live "/async_demo4", Async.Example4Live, :index
    live "/async_demo5", Async.Example5Live, :index
    live "/async_demo6", Async.Example6Live, :index

    # ssot
    live "/ssot_before", Before.CounterLive, :index
    live "/ssot_after", After.CounterLive, :index

    # send_update
    live "/send_update_before", Before.DemoLive, :index
    live "/send_update_after", After.DemoLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DummyWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:dummy, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: DummyWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
