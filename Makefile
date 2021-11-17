# CI Steps
#
# Considerations
# - Easy to debug: show the command being run
# - Leverage CI features: Only run individual steps so we can use features like reporting elapsed time per step

ARGS?=
TOOLCHAIN_TARGET ?=
ifneq (${TOOLCHAIN_TARGET},)
  ARGS+=--target ${TOOLCHAIN_TARGET}
endif

_FEATURES = minimal default wasm full release
_FEATURES_minimal = --no-default-features --features "std cargo"
_FEATURES_default =
_FEATURES_wasm = --features "yaml regex unstable-replace unstable-multicall unstable-grouped"
_FEATURES_full = --features "wrap_help yaml regex unstable-replace unstable-multicall unstable-grouped"
_FEATURES_debug = ${_FEATURES_full} --features debug
_FEATURES_release = ${_FEATURES_full} --release

check-%:
	cargo check --all-targets ${ARGS} ${_FEATURES_${@:check-%=%}}

build-%:
	cargo test --no-run ${ARGS} ${_FEATURES_${@:build-%=%}}

test-%:
	cargo test ${ARGS} ${_FEATURES_${@:test-%=%}}