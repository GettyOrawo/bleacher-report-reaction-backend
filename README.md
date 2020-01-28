# ReactionTracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


# **Existing Endpoints**

 * GET /reaction   => Gets all the existing reactions
 * POST /reaction    => Saves a payload to database and in memory cache
 * GET /reaction/:user_id    => Gets a single reaction using its user id
 * GET /reaction_counts/:content_id   => Gets reaction counts per the content id specified
 
 * Integrated in memory Cache storing using Erlang's :ets
 * Used Genservers to spawn up a process for each request for concurrent execution
  
  I enjoyed doing the codetest, quite challenging but was up to the task. Thanks for the opportunity!
