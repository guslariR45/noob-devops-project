# ------------------------------------------------------------------------------
# MEMBERS (Adding users to teams)
# ------------------------------------------------------------------------------

resource "github_team_membership" "developer_1" {
  team_id  = github_team.team_developers.id
  username = "maliBrzi"
  role     = "member"
}

resource "github_team_membership" "devops_1" {
  team_id  = github_team.team_devops.id
  username = "plaviDecak"
  role     = "member"
}
