#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PBCCHAIND=${PBCCHAIND:-$BINDIR/pbcchaind}
PBCCHAINCLI=${PBCCHAINCLI:-$BINDIR/pbcchain-cli}
PBCCHAINTX=${PBCCHAINTX:-$BINDIR/pbcchain-tx}
PBCCHAINQT=${PBCCHAINQT:-$BINDIR/qt/pbcchain-qt}

[ ! -x $PBCCHAIND ] && echo "$PBCCHAIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
PBCVER=($($PBCCHAINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for pbcchaind if --version-string is not set,
# but has different outcomes for pbcchain-qt and pbcchain-cli.
echo "[COPYRIGHT]" > footer.h2m
$PBCCHAIND --version | sed -n '1!p' >> footer.h2m

for cmd in $PBCCHAIND $PBCCHAINCLI $PBCCHAINTX $PBCCHAINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${PBCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${PBCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
