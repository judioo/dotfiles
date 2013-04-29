#!/src/me/only

function _setup_PERL5LIB {
  perl5lib_includes=(
    "t"
    "lib"
  )

  # This will grow as people cd around
  PERL5LIB="${LOCAL_PERL5LIB}"

  for lib in "${perl5lib_includes[@]}"; do
    pathname="$(pwd)/${lib}"

    # stop items appearing in PERL5LIB twice
    if ! echo "${PERL5LIB}" | grep "${pathname}" >/dev/null; then
      PERL5LIB="${pathname}:${PERL5LIB}"
    fi
  done

  export PERL5LIB
  echo "PERL5LIB now $PERL5LIB"
}

_setup_PERL5LIB  && unset _setup_PERL5LIB
