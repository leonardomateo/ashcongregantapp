# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias Church.Congregant

# Sample profiles data
profiles = [
  %{
    first_name: "John",
    last_name: "Doe"
  },
  %{
    first_name: "Jane",
    last_name: "Smith"
  },
  %{
    first_name: "Michael",
    last_name: "Johnson"
  },
  %{
    first_name: "Sarah",
    last_name: "Williams"
  },
  %{
    first_name: "David",
    last_name: "Brown"
  },
  %{
    first_name: "Maria",
    last_name: "Garcia"
  }
]

# Create the profiles
IO.puts("\n=== Creating Sample Profiles ===\n")

Enum.each(profiles, fn attrs ->
  case Congregant.create_profile(attrs) do
    {:ok, profile} ->
      IO.puts("Created profile for #{profile.first_name} #{profile.last_name}")

    {:error, error} ->
      IO.puts("Error creating profile: #{inspect(error)}")
  end
end)

IO.puts("\n=== Seeding Completed ===\n")
