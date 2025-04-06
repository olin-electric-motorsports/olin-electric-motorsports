load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkvii.dbc",
    srcs = [
    	"//projects/can_print:can_print.yml",
    	
        "//vehicle/common/emeter:emeter.dbc",
        "//vehicle/common/gmeter:gmeter.dbc",
        "//vehicle/common/lpms-cu2:lpms-cu2.dbc",
        "//vehicle/common/gps:gps.dbc",
        "//vehicle/common/motor_controller:cm200dx.dbc",
        
        "//vehicle/mkvii/software/air_control:air.yml",
        "//vehicle/mkvii/software/bms:bms.yml",
        
        "//vehicle/mkvii/software/lv/bspd:bspd.yml",
        "//vehicle/mkvii/software/lv/dashboard:dashboard.yml",
        "//vehicle/mkvii/software/lv/throttle:throttle.yml",
        
        "//vehicle/mkvii/software/integration/charging:charger.yml",
        "//vehicle/mkvii/software/integration/pdu:pdu.yml",
        
        "//vehicle/mkvii/software/sensing/wheel_speed:wheel_speed.yml",
        "//vehicle/mkvii/software/sensing/sus_travel:sus_travel.yml",
        "//vehicle/mkvii/software/sensing/sus_strain:sus_strain.yml",
    ],
)
