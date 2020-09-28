defmodule CreditWeb.ErrorView do
  use CreditWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  def render("404.json", _assigns) do
    %{errors: %{status: "404", detail: "Not Found"}}
  end

  def render("422.json", %{changeset: changeset}) do
    %{errors: %{status: "422", detail: "Unprocessable Entity", reason: translate_errors(changeset)}}
  end

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end
end
