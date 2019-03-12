defmodule Teammates.Repo.Migrations.CreateTeamMembers do
  use Ecto.Migration

  def change do
    create table(:team_members) do
      add :name, :text
      add :time_zone, :text

      timestamps()
    end

  end
end
