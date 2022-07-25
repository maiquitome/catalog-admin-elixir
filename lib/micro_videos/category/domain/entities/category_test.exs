defmodule MicroVideos.CategoryTest do
  use ExUnit.Case

  alias MicroVideos.Category
  alias Ecto.Changeset

  describe "Category Unit Tests" do
    test "valid changeset" do
      # name
      attrs = %{name: "Action"}
      response = Category.changeset(attrs)
      assert response.changes == attrs
      assert response.valid? == true

      # name, description
      attrs = %{name: "Action", description: "some description"}
      response = Category.changeset(attrs)
      assert response.changes == attrs
      assert response.valid? == true

      # name, active = false
      attrs = %{name: "Action", active: false}
      response = Category.changeset(attrs)
      assert response.changes == attrs
      assert response.valid? == true

      # name, active = true
      attrs = %{name: "Action", active: true}
      response = Category.changeset(attrs)
      assert response.changes == %{name: "Action"}
      assert response.valid? == true

      # name, description, active
      attrs = %{name: "Action", description: "another description", active: false}
      response = Category.changeset(attrs)
      assert response.changes == attrs
      assert response.valid? == true
    end

    test "invalid changeset" do
      attrs = %{description: "description", active: false}
      response = Category.changeset(attrs)
      assert response.changes == attrs
      assert response.errors == [name: {"can't be blank", [validation: :required]}]
      assert response.valid? == false
    end
  end
end
