param ($github_ref, 
	[AllowEmptyString()]
	[string] $github_event_name, 

	[AllowEmptyString()]
	[string] $head_ref_branch,

	[AllowEmptyString()]
	[string] $ref_branch, 
	
	[AllowEmptyString()]
	[string] $strip_tag_prefix
)

if ( "${github_ref}" -ne "refs/tags/") {
	if ($github_event_name -eq 'pull_request' ) {
		echo "::set-output name=current_branch::$head_ref_branch"
	}
 	else {
		echo "::set-output name=current_branch::$ref_branch"
	}
}
else {
	$REF = "${github.ref }"
	$REF_BRANCH = ${$REF/refs\/tags\/$strip_tag_prefix/}
	echo "::set-output name=current_branch::"${REF_BRANCH"}""
}
