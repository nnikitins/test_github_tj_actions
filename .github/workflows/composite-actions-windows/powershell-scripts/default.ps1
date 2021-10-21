param($github_ref, $current_branch, $ref_branch)

if ("${github_ref}" -ne "refs/tags/"*) {
  if ("${current_branch}" -eq "${ref_branch}" ) {
    Write-Output "::set-env name=is_default::true"
   } else {
    Write-Output "::set-env name=is_default::false"
   }
}
