terraform {
  backend "remote" {
    organization = "little-core-labs"

    workspaces {
      name = "tf-cloud"
    }
  }
}

provider "aws" {
  region  = "us-east-2"
  version = "~> 2.61"
}

provider "tfe" {
  version  = "~> 0.15.0"
}

variable "gh_machine_token" {
  type        = string
  description = "Github l12s-bot PAT"
  default     = null
}

provider "github" {
  token        = var.gh_machine_token
  organization = "little-core-labs"
  version      = "~> 2.7.0"
}

resource "tfe_organization" "little_core_labs" {
  name  = "little-core_labs"
  email = "12core@littlstar.com"
}

resource "tfe_workspace" "tf_cloud" {
  name         = "tf-cloud"
  organization = tfe_organization.little_core_labs.name
}

resource "tfe_workspace" "rad_live" {
  name         = "rad-live"
  organization = tfe_organization.little_core_labs.name
}
