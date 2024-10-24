load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)

_C_ALL_COMPILE_ACTIONS = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.assemble,
]

_LD_ALL_ACTIONS = [
    ACTION_NAMES.cpp_link_executable,
]

_ALL_WARNINGS_FEATURE = feature(
    name = "all_warnings",
    enabled = True,
    flag_sets = [
        flag_set(
            actions = _C_ALL_COMPILE_ACTIONS,
            flag_groups = [
                flag_group(flags = ["-Wall"]),
            ],
        ),
    ],
)

_ALL_WARNINGS_AS_ERRORS_FEATURE = feature(
    name = "all_warnings_as_errors",
    enabled = True,
    flag_sets = [
        flag_set(
            actions = _C_ALL_COMPILE_ACTIONS,
            flag_groups = [
                flag_group(flags = ["-Werror"]),
            ],
        ),
    ],
)

_DEBUG_FEATURE = feature(
    name = "dbg",
    enabled = False,
    flag_sets = [
        flag_set(
            actions = _C_ALL_COMPILE_ACTIONS,
            flag_groups = [
                flag_group(flags = ["-Os", "-g3"]),
            ],
        ),
    ],
    provides = ["compilation_mode"],
)

_OPT_FEATURE = feature(
    name = "opt",
    enabled = False,
    flag_sets = [
        flag_set(
            actions = _C_ALL_COMPILE_ACTIONS,
            flag_groups = [
                flag_group(
                    flags = ["-Os", "-ffunction-sections", "-fdata-sections"],
                ),
            ],
        ),
    ],
    provides = ["compilation_mode"],
)

_SET_MIN_PAGE_SIZE = feature(
    name = "set_min_page_size",
    enabled = False,
    flag_sets = [
        flag_set(
            actions = _C_ALL_COMPILE_ACTIONS,
            flag_groups = [
                flag_group(flags = ["--param=min-pagesize=0"]),
            ],
        ),
    ],
)

_DEFAULT_FEATURE = feature(
    name = "default",
    enabled = True,
    flag_sets = [
        flag_set(
            actions = _C_ALL_COMPILE_ACTIONS,
            flag_groups = [
                flag_group(flags = ["-fno-jump-tables"]),
            ],
        ),
    ],
)

def AvrDeviceFeature(name, frequency):
    return feature(
        name = "device",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = _C_ALL_COMPILE_ACTIONS + _LD_ALL_ACTIONS,
                flag_groups = [
                    flag_group(
                        flags = [
                            "-mmcu=" + name,
                            "-DF_CPU=" + frequency,
                        ],
                    ),
                ],
            ),
        ],
    )

CC_ALL_COMMON_FEATURES_INFO = {
    "all_warnings": "Contains feature to enable all warnings",
    "all_warnings_as_errors": "Contains a feature to treat all warnings as errors",
    "dbg": "Compile with debug symbols",
    "opt": "Compile a release build with, optimisation turned on",
    "default": "Default C flags",
    "device": "The device name and CPU frequency",
    "set_min_page_size": "Set minimum page size to 0 to prevent warning",
    "type_name": "The type name for this provider",
}

CcAllCommonFeaturesInfo = provider(fields = CC_ALL_COMMON_FEATURES_INFO)

def AvrGetCommonFeatures(device_name, device_frequency):
    return CcAllCommonFeaturesInfo(
        all_warnings = _ALL_WARNINGS_FEATURE,
        all_warnings_as_errors = _ALL_WARNINGS_AS_ERRORS_FEATURE,
        dbg = _DEBUG_FEATURE,
        opt = _OPT_FEATURE,
        default = _DEFAULT_FEATURE,
        set_min_page_size = _SET_MIN_PAGE_SIZE,
        device = AvrDeviceFeature(device_name, device_frequency),
        type_name = "cc_all_common_feature_info",
    )

def LinuxGetCommonFeatures():
    return CcAllCommonFeaturesInfo(
        all_warnings = _ALL_WARNINGS_FEATURE,
        all_warnings_as_errors = _ALL_WARNINGS_AS_ERRORS_FEATURE,
        dbg = _DEBUG_FEATURE,
        opt = _OPT_FEATURE,
        type_name = "cc_all_common_feature_info",
    )
