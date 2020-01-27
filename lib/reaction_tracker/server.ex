defmodule ReactionTracker.Server do
  use GenServer

  #client


  def start_link(params) when is_map(params) do
    GenServer.start_link(__MODULE__, params)
  end

  def save_reaction({:ok, pid}) do

    GenServer.call(pid, :save_reaction)
    
  end

  #server

  def init(params) do
    {:ok, params}
  end

  def handle_call(:save_reaction, _, params) do
    #trying to save the reaction

    {:reply, ReactionTracker.create_or_update_reaction(params), params, 5000}
  end

  def handle_info(:timeout, state) do
    {:stop, :termination, state}
  end

end
