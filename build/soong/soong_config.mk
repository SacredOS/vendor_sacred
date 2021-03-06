add_json_str_omitempty = $(if $(strip $(2)),$(call add_json_str, $(1), $(2)))

_contents := $(_contents)    "Sacred":{$(newline)

$(call add_json_bool, Uses_generic_camera_parameter_library, $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),,true))
$(call add_json_bool, Needs_text_relocations, $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)))
$(call add_json_bool, Uses_non_treble_camera, $(filter true,$(TARGET_USES_NON_TREBLE_CAMERA)))
$(call add_json_bool, Has_legacy_camera_hal1, $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)))
$(call add_json_bool, Uses_media_extensions, $(filter true,$(TARGET_USES_MEDIA_EXTENSIONS)))
$(call add_json_bool, Uses_qti_camera_device, $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)))
$(call add_json_bool, BoardUsesQTIHardware, $(filter true,$(BOARD_USES_QTI_HARDWARE)))
$(call add_json_bool, BoardUsesQCOMHardware, $(filter true,$(BOARD_USES_QCOM_HARDWARE)))
$(call add_json_bool, TargetUsesQCOMBsp, $(filter true,$(TARGET_USES_QCOM_BSP)))
$(call add_json_bool, TargetUsesQCOMLegacyBsp, $(filter true,$(TARGET_USES_QCOM_LEGACY_BSP)))
$(call add_json_bool, BoardUsesLegacyAlsa, $(filter true,$(BOARD_USES_LEGACY_ALSA_AUDIO)))
$(call add_json_bool, Cant_reallocate_omx_buffers, $(filter true,$(if $(filter omap4,$(TARGET_BOARD_PLATFORM)),true,false)))
$(call add_json_str, Specific_camera_parameter_library, $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY))
$(call add_json_str, BTVendorPath, $(call project-path-for,bt-vendor))
$(call add_json_str, RILPath, $(call project-path-for,ril))
$(call add_json_str, WLANPath, $(call project-path-for,wlan))
$(call add_json_str_omitempty, Target_shim_libs, $(TARGET_LD_SHIM_LIBS))
$(call add_json_str, Java_Source_Overlays, $(JAVA_SOURCE_OVERLAYS))
$(call add_json_str, QCOMAudioPath, $(call project-path-for,qcom-audio))
$(call add_json_str, QCOMCameraPath, $(call project-path-for,qcom-camera))
$(call add_json_str, QCOMDataservicesPath, $(call project-path-for,qcom-dataservices))
$(call add_json_str, QCOMDisplayPath, $(call project-path-for,qcom-display))
$(call add_json_str, QCOMGPSPath, $(call project-path-for,qcom-gps))
$(call add_json_str, QCOMMediaPath, $(call project-path-for,qcom-media))
$(call add_json_str, QCOMSensorsPath, $(call project-path-for,qcom-sensors))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_contents := $(_contents)__SV_END

_contents := $(_contents)    },$(newline)
