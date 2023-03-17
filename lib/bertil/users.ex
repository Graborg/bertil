defmodule Bertil.Users do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def add_user(user_id) do
    GenServer.call(__MODULE__, {:add_user, user_id})
  end

  def handle_call({:add_user, user_id}, users) do
    user_handler = GenServer.start_link(Bertil.Time, nil)
    new_users = Map.put_new(users, user_id, user_handler)

    {:reply, :ok, new_users}
  end
end
