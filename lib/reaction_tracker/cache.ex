defmodule ReactionTracker.Cache do
  use GenServer

  # client

def start_link(params) do
  GenServer.start_link(__MODULE__, params, name: ReactionCache)
end

def init(state) do
  :ets.new(:reaction_tracker_cache, [:set, :public, :named_table])
  {:ok, state}
end

#saving to in memory cache
def create(key, params) do
  GenServer.cast(ReactionCache, {:create, key, params})
end

#retrieving from in memory cache
def get(key) do
  GenServer.call(ReactionCache, {:get, key})
end


# server

def handle_cast({:create, key, params}, state) do
  :ets.insert(:reaction_tracker_cache, {:key, params})
  {:noreply, state}
end


def handle_call({:get, key}, _from, state) do
  reply = 
  case :ets.lookup(:reaction_tracker_cache, key) do
    [{_key, reaction}] -> reaction
    [] -> nil
    
  end
    {:reply, reply, state,}

end


def handle_info(:timeout, state) do
    {:stop, :termination, state}
  end
end