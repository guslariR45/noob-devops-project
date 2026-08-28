terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "guslariR45" 
}

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

# ------------------------------------------------------------------------------
# PERMISSIONS (Mapping Teams to the repository)
# ------------------------------------------------------------------------------
# noob-devops-project must be transferred into the guslariR45 org first -
# a team can only be granted access to a repo owned by its own organization.

# Team Developers gets push (write) access to noob-devops-project
resource "github_team_repository" "team_developers_repo" {
  team_id    = github_team.team_developers.id
  repository = "noob-devops-project"
  permission = "push"
}

# Team DevOps gets push (write) access to noob-devops-project
resource "github_team_repository" "team_devops_repo" {
  team_id    = github_team.team_devops.id
  repository = "noob-devops-project"
  permission = "push"
}
