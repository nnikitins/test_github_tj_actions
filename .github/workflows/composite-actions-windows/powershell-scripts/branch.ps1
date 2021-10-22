param ($github_ref, 
	[AllowEmptyString()]
	[string] $github_base_ref, 

	[AllowEmptyString()]
	[string] $github_head_ref
)

if ($github_ref -ne "refs/tags/") {
	$BASE_REF = "${github_base_ref }"
	$HEAD_REF = "${github_head_ref}" 
	$REF = "${github_ref}"
	$BASE_REF = ${BASE_REF/refs\/heads\//}
	$HEAD_REF = ${HEAD_REF/refs\/heads\//}
	
	echo "::set-output name=base_ref_branch::"${BASE_REF"}""
	echo "::set-output name=head_ref_branch::"${HEAD_REF"}""
            
	$REF_BRANCH = ${REF/refs\/pull\//}
	$REF_BRANCH = ${REF_BRANCH/refs\/heads\//}

	echo "::set-output name=ref_branch::"${REF_BRANCH"}""
}
