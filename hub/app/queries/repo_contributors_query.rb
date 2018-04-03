RepoContributorsQuery = Hub::Client.parse <<-GQL
  query($repo_owner:String!, $repo_name:String!, $count:Int) {
    repository(owner:$repo_owner, name:$repo_name) {
      collaborators(first:$count) {
        nodes {
          login
          name
        }
      }
    }
  }
GQL
