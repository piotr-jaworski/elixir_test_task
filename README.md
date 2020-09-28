# Credit

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Available requests
## List all of credits
curl -H "Content-Type: application/json" -X GET \
http://localhost:4000/api/credit

## Show one credit
curl -H "Content-Type: application/json" -X GET \
http://localhost:4000/api/credit/:id


## Add new credit
return 422 because of bad Data
curl -H "Content-Type: application/json" -X POST \
-d '{"credit":{"amount": "100000", "avg_income": "2000.0", "interest": "0.04", "period": "10", "avg_expenses": "1000"}}' \
http://localhost:4000/api/credit

create new and return it with 201
curl -H "Content-Type: application/json" -X POST \
-d '{"credit":{"amount": "100000", "avg_income": "20000.0", "interest": "0.04", "period": "10", "avg_expenses": "1000"}}' \
http://localhost:4000/api/credit