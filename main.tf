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

variable "tfe_little_core_labs" {
  type        = string
  description = "Github l12s-bot PAT"
  default     = "little-core-labs"
}

data "tfe_workspace" "test" {
  name         = "tf-cloud"
  organization = var.tfe_little_core_labs
}

resource "tfe_workspace" "rad_live" {
  name         = "rad-live"
  organization = var.tfe_little_core_labs
}
