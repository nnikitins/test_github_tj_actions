param($github_ref, $strip_tag_prefix)

if ("${github_ref}" -eq "refs/tags/") {
	$REF="${github_ref}"
	$TAG=${$REF/refs\/tags\/$strip_tag_prefix/}
	Write-Output "::set-env name=tag::$TAG"
	Write-Output "::set-env name=is_tag::true"
} else {
	Write-Output "::set-env name=is_tag::false"
}