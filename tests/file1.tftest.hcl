run "bad_input_url_should_fail" {
  command = plan

  variables {
    github_repo = "http://example.com"
  }

  expect_failures = [
    var.github_repo
  ]
}