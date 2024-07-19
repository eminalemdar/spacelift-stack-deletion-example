resource "spacelift_stack" "first_stack" {
  github_enterprise {
    namespace = "eminalemdar" # The GitHub organization / user the repository belongs to
  }

  autodeploy        = true
  branch            = "master"
  description       = "Example stack number one"
  name              = "first_stack"
  repository        = "spacelift-demo-randomstring"
  terraform_version = "1.5.7"
}

resource "spacelift_stack" "second_stack" {
  github_enterprise {
    namespace = "eminalemdar" # The GitHub organization / user the repository belongs to
  }

  autodeploy        = true
  branch            = "master"
  description       = "Example stack number two"
  name              = "second_stack"
  repository        = "spacelift-demo-randomstring"
  project_root      = "second-stack"
  terraform_version = "1.5.7"
}

resource "spacelift_stack_destructor" "first" {
  stack_id = spacelift_stack.first_stack.id
}

resource "spacelift_stack_destructor" "second" {
  stack_id = spacelift_stack.second_stack.id
}