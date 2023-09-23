<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 16.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 16.3.0 |

## Resources

| Name | Type |
|------|------|
| [gitlab_branch_protection.branch_protect](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/branch_protection) | resource |
| [gitlab_branch_protection.main](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/branch_protection) | resource |
| [gitlab_deploy_token.wa-gtlb-grp](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/deploy_token) | resource |
| [gitlab_group.wa-gtlb-grp](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/group) | resource |
| [gitlab_group_access_token.wa-gtlb-grp](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/group_access_token) | resource |
| [gitlab_group_variable.wa-var](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/group_variable) | resource |
| [gitlab_project.wa-gtlb-grp](https://registry.terraform.io/providers/gitlabhq/gitlab/16.3.0/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | GitLab API token | `string` | n/a | yes |
| <a name="input_gitlab_url"></a> [gitlab\_url](#input\_gitlab\_url) | Gitlab URL | `string` | `"https://gitlab.eth0.pp.ua/api/v4"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gitlab_repo_url"></a> [gitlab\_repo\_url](#output\_gitlab\_repo\_url) | Repo url |
<!-- END_TF_DOCS -->