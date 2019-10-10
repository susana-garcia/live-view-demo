defmodule LiveViewDemoWeb.FilterLive do
  @moduledoc """
  Filter Live module
  """
  use Phoenix.LiveView
  alias LiveViewDemoWeb.Router.Helpers

  def render(assigns) do
    ~L"""
    <p><b>Country starts with...</b></p>
    <form phx-change="search"><input type="text" name="query" value="<%= @query %>" placeholder="Search..." /></form>
    <table>
      <thead>
        <tr>
          <th>
            Name
          </th>
        </tr>
      </thead>
      <tbody>
        <%= for row <- rows(assigns) do %>
          <tr>
            <td><%= row["name"] %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, data: LiveViewDemo.Country.list(), query: nil)}
  end

  def handle_params(params, _url, socket) do
    query = params["query"]
    {:noreply, assign(socket, query: query)}
  end

  def handle_event("search", %{"query" => query}, socket) do
    {:noreply, redirect_with_attrs(socket, query: query)}
  end

  defp redirect_with_attrs(socket, attrs) do
    query = attrs[:query] || socket.assigns[:query]

    live_redirect(socket, to: Helpers.live_path(socket, __MODULE__, query: query))
  end

  defp rows(%{data: data, query: query}) do
    filter(data, query)
  end

  defp filter(rows, query) do
    rows |> Enum.filter(&(String.match?(&1["name"], ~r/^#{query}/i)))
  end
end
