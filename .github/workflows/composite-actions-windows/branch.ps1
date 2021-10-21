param ($github_ref, $github_base_ref, $github_head_ref)

if ($github_ref -ne "refs/tags/") {
              $BASE_REF="${github_base_ref }"
              $HEAD_REF="${github_head_ref}" 
              $REF= "${github_ref}"
              $BASE_REF=${BASE_REF/refs\/heads\//}
              $HEAD_REF=${HEAD_REF/refs\/heads\//}
              Write-Output "::set-env name=base_ref_branch::"${BASE_REF}""
              Write-Output "::set-env name=head_ref_branch::"${HEAD_REF}""
            
              $REF_BRANCH=${REF/refs\/pull\//}
              $REF_BRANCH=${REF_BRANCH/refs\/heads\//}
              Write-Output "::set-env name=ref_branch::"${REF_BRANCH}""
}
