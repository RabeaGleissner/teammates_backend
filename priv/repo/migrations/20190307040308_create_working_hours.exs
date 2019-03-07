defmodule TeamMates.Repo.Migrations.CreateWorkingHours do
  use Ecto.Migration

  def change do
    create table(:working_hours) do
      add :start, :time
      add :finish, :time
      add :date, :date
      add :user_id, references(:team_members, on_delete: :delete_all)

      timestamps()
    end

    create index(:working_hours, [:user_id])
  end
end
