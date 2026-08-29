# ------------------------------------------------------------------------------
# TEAMS (GROUPS)
# ------------------------------------------------------------------------------

# Team Developers
resource "github_team" "team_developers" {
  name        = "team-developers"
  description = "Team for developing apps"
  privacy     = "closed"
}

# Team DeVops
resource "github_team" "team_devops" {
  name        = "team-devops"
  description = "Team for maintaning system"
  privacy     = "closed"
}
