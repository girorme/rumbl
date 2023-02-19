defmodule Rumbl.Accounts do
  alias Rumbl.Repo
  alias Rumbl.Accounts.User

  import Ecto.Changeset

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def list_users do
    Repo.all(User)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def delete_user(id) do
    get_user(id)
    |> Repo.delete()
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

  def change_registration(%User{} = user, params) do
    User.registration_chageset(user, params)
  end

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.registration_chageset(attrs)
    |> Repo.insert()
  end
end
