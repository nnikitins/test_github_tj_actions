param ($github_ref, 
	[Switch]
	$github_event_name, 
	[Switch]
	$head_ref_branch,
	[Switch]
	$ref_branch, 
	[Switch]
	$strip_tag_prefix
)

if ( "${github_ref}" -ne "refs/tags/") {
	if ($github_event_name -eq 'pull_request' ) {
		Write-Output "::set-env name=current_branch::$head_ref_branch"
	}
 else {
		Write-Output "::set-env name=current_branch::$ref_branch"
	}
}
else {
	$REF = "${github.ref }"
	$REF_BRANCH = ${$REF/refs\/tags\/$strip_tag_prefix/}
	Write-Output "::set-env name=current_branch::"${REF_BRANCH"}""
}
