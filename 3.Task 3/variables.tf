variable "gitlab_url" {
  description = "Gitlab URL"
  type = string
  default = "https://gitlab.eth0.pp.ua/api/v4"
}

variable "gitlab_token" {
  type        = string
  description = "GitLab API token"
}

variable "url" {
  description = "Url to some sevice"
  type = string
  default = "https://eth0.pp.ua"
}

