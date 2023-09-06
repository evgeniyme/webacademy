# Configure the GitLab Provider
provider "gitlab" {
  token = var.gitlab_token
  base_url = var.gitlab_url
}

resource "gitlab_group" "wa-gtlb-grp" {
  name        = "terraform-auto"
  path        = "terraform-auto"
  description = "Group created by TF"
} 

# Create a project in the example group
resource "gitlab_project" "wa-gtlb-grp" {
  name         = "terraform-infra"
  description  = "Repo created by TF"
  namespace_id = gitlab_group.wa-gtlb-grp.id
  initialize_with_readme = true
}