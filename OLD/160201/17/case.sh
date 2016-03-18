case "$1" in
    ""      ) lines=50;;
    *[!0-9]*) echo "Usage: `basename $0` lines-to-cleanup";
     exit $E_WRONGARGS;;
    *       ) lines=$1;;
    esac

