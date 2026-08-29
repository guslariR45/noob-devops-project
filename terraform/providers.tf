terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  cloud {
    organization = "guslariR45"

    workspaces {
      name = "noob-devops-project-teams"
    }
  }
}
