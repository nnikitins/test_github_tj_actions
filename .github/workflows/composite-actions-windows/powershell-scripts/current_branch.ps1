param ($github_ref, 
	[Parameter(Mandatory=$false)]
  	[Switch]
	$github_event_name, 

	[Parameter(Mandatory=$false)]
  	[Switch]
	$head_ref_branch,

	[Parameter(Mandatory=$false)]
  	[Switch]
	$ref_branch, 
	
	[Parameter(Mandatory=$false)]
  	[Switch]
	$strip_tag_prefix
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
