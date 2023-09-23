# Configure the GitLab Provider
provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_url
}

# Create a GitLab Group
resource "gitlab_group" "wa-gtlb-grp" {
  name        = "terraform-auto"
  path        = "terraform-auto"
  description = "Group created by TF"
}

# Create a project in the wa-gtlb-grp group
resource "gitlab_project" "wa-gtlb-grp" {
  name         = "terraform-infra"
  description  = "Repo created by TF"
  namespace_id = gitlab_group.wa-gtlb-grp.id
  initialize_with_readme = true
}

# Create a GitLab Group Access Token
resource "gitlab_group_access_token" "wa-gtlb-grp" {
  group        = gitlab_group.wa-gtlb-grp.id
  name         = "wa-gtlb-grp project access token"
  expires_at   = "2023-12-31"
  access_level = "developer"
  scopes       = ["api"]
}

# wa-gtlb-grp Usage - Project Deploy Token
resource "gitlab_deploy_token" "wa-gtlb-grp" {
  project    = gitlab_project.wa-gtlb-grp.id
  name       = "wa-gtlb-grp deploy token"
  username   = "wa-gtlb-grp-username"
  expires_at = "2020-03-14T00:00:00.000Z"
  scopes     = ["read_repository", "read_registry"]
}

# GitLab Branch Protection
resource "gitlab_branch_protection" "branch_protect" {
  project                = gitlab_project.wa-gtlb-grp.id
  branch                 = "BranchProtected"
  push_access_level      = "developer"
  merge_access_level     = "developer"
  unprotect_access_level = "developer"
  allow_force_push       = true
  code_owner_approval_required = true

  allowed_to_push {
    user_id = 5
  }

  allowed_to_push {
    user_id = 521
  }

  allowed_to_merge {
    user_id = 15
  }

  allowed_to_merge {
    user_id = 37
  }

  allowed_to_unprotect {
    user_id = 15
  }

  allowed_to_unprotect {
    group_id = 42
  }
}

# wa-gtlb-grp using dynamic block
resource "gitlab_branch_protection" "main" {
  project                = gitlab_project.wa-gtlb-grp.id
  branch                 = "main"
  push_access_level      = "maintainer"
  merge_access_level     = "maintainer"
  unprotect_access_level = "maintainer"

  dynamic "allowed_to_push" {
    for_each = [50, 55, 60]
    content {
      user_id = allowed_to_push.value
    }
  }
}

resource "gitlab_group_variable" "wa-var" {
  group             = gitlab_project.wa-gtlb-grp.id
  key               = "Service host"
  value             = "var.url"
  protected         = false
  masked            = false
}