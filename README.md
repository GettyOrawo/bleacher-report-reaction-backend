# ReactionTracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


What I managed to do
 * I managed to create an endpoint that receives JSON input*
 * Managed to capture payload and save it on the database*
 * Can show a single payload*
 * Can display all the recorded reactions*
 *You can view reactions and their count based on the content id by passing the content_id as a parameter to /reactions i.e /reactions/:contents_id*
 
 What I didn't manage to do
  *Create an OTP Genserver for concurrency*
  *Display the correct count of reactions per content_id*
  *Update a an existing user's details instead of creating a similar record. This raises an exception on expecting one but receiving more*
  
  I enjoyed doing the codetest, quite challenging but I was up to the task if not limited with time. Thanks for the opportunity!
