defmodule EconDataviz do
  use Application

  def start(_type, _args) do
    port = Application.get_env(:econ_dataviz, :cowboy_port, 8080)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, EconDataviz.Plug.Router, [], port: port)
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end