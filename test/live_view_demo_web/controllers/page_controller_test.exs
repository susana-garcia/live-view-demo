defmodule LiveViewDemoWeb.PageControllerTest do
  use LiveViewDemoWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Live View Demo!"
  end
end
